import torch
import torch.nn.functional as F  # 需要导入F，它包含softmax等函数

#注意这里只是用了pytorch实现了框架（而且不是官方版本），各个超参数还没有填

"""
这里是给出初始化参数
"""
#批次大小，一次处理多少个样本
batch_size = 1
#特征维度，表示每个token的向量表示维度
dim = 1
#t为k/v整体长度
t = 1
#步长为d
d = 1
#窗口长度为l
l = 1
#最大索引：需要处理的窗口的整体数量
max_idx = round((t-l)/d)

"""
这里是初始化，Q，K，V
"""
#创建输入向量X，t为多少个token，dim为每个token表示多少个维度
X = torch.randn(batch_size, t, dim)
#创建Q，K，V weight矩阵
Wq = torch.randn(dim, dim)
Wk = torch.randn(dim, dim)
Wv = torch.randn(dim, dim)
#使用矩阵乘法（@）计算Q，K，V(batch_size, t, dim)
Q = X @ Wq
K = X @ Wk
V = X @ Wv

#实现压缩注意力机制
#定义K，V压缩weight矩阵
#l行1列
W_K_cmp = torch.randn(l, 1) 
W_V_cmp = torch.randn(l, 1)
#定义位置编码weight l行，dim列
W_pe = torch.randn(l, dim)


#实现压缩处理(压缩的是l：即token的个数，将多个token压缩成一个token)
#初始化压缩后的K，V矩阵
K_cmp = []
V_cmp = []
#遍历所有窗口
for i in range(max_idx):
    #提取第i个窗口的K，V的l行，并添加位置编码
    cur_K = K[:, i * d + 0: i * d + l , :] + W_pe.unsqueeze(0)
    cur_V = V[:, i * d + 0: i * d + l , :] + W_pe.unsqueeze(0)
    #压缩操作，转置后和压缩weight相乘
    #(batch_size,l,dim)->(batch_size,dim,l)@(l,1) == (batch,dim,1)
    cur_K = cur_K.transpose(1, 2) @ W_K_cmp 
    cur_V = cur_V.transpose(1, 2) @ W_V_cmp
    #将压缩后的结果添加到结果矩阵中
    K_cmp.append(cur_K)
    V_cmp.append(cur_V)
#将所有窗口的压缩结果拼接起来，这里是按照第二维度（即拼接最后一个维度）进行拼接
#拼接完（batch,dim,seq(多个1拼接)）然后将第一维度和第二维度进行转置（batch,seq,dim）
K_cmp = torch.cat(K_cmp, dim = 2).transpose(1,2)
V_cmp = torch.cat(V_cmp, dim = 2).transpose(1,2)
#这里是打印，无关紧要
print(K_cmp.shape)
print(V_cmp.shape)

#有几个头，每个头有多少维度（dim）
heads = 1
head_dim = dim/heads
#这里需要注意，这里是block_nums是压缩后的seq长度
block_nums = K_cmp.size(1)

#将压缩后的K_cmp,V_cmp进行多头注意力计算
# 将Q、K_cmp、V_cmp重塑为多头形式
#view重塑操作，将dim拆成heads，head_dim维度
#（batch,seq,dim）->(batch,seq,heads,head_dim)转置（batch,heads,seq,head_dim）
Q_mha = Q.view(1, t, heads, head_dim).transpose(1,2)
K_cmp_mha = K_cmp.view(1, block_nums, heads, head_dim).transpose(1,2)
V_cmp_mha = V_cmp.view(1, block_nums, heads, head_dim).transpose(1,2)
#(batch,heads,q_seq,head_dim)@(batch,heads,head_dim,k_seq) ==(batch,heads,q_seq,k_seq)
score_cmp = Q_mha @ K_cmp_mha.transpose(2,3)
print(score_cmp.shape) 

#应用softmax得到注意力weight，沿着最后一个维度应用softmax->(batch,heads,q_seq,k_seq)
p_cmp = F.softmax(score_cmp, dim = -1)
#计算加权和
#(batch,heads,q_seq,k_seq)@(batch,heads,v_seq,head_dim) == (batch,heads,q_seq,head_dim)
o_cmp = p_cmp @ V_cmp_mha
print(o_cmp.shape) 
#转置 ->(batch,q_seq,heads,head_dim) 再合并维度(batch,q_seq == t,dim)，与输入Q的形状相同
o_cmp = o_cmp.transpose(2, 1).reshape(batch_size, t, dim)
print(o_cmp.shape)

#选择注意力实现
#将多头压缩注意力分数聚合
# 将多头压缩注意力分数在头维度上聚合(不是合并到其他维度上面了，是把所有的heads维度消掉了)
p_slc = p_cmp.sum(dim=1)  
#(batch_size, heads, q_seq, k_seq)->(batch_size, q_seq, k_seq)

#选择最重要的两个片段索引
select_top_k = 2
#torch.topk在k_seq维度上取前两个值
#idx(batch_size,q_seq,select_top_k)
_, idx = torch.topk(p_slc, dim = 2, k = select_top_k)
print(idx[0,0,:]) # [3,0] 即 q0注意到第3片段和第0片段
idx.shape # [1, 32, 2] : batch_size, q_len, top_k

#计算选中片段的起始和结束索引
idx_slc_start = idx * d
idx_slc_end = idx * d + l
#K_slc,V_slc用来存储选中的键值对
#这里的t代表的是q_seq
K_slc = torch.randn(batch_size, t, d * select_top_k, dim)
V_slc = torch.randn(batch_size, t, d * select_top_k, dim)
#遍历每个批次，每个查询位置，每个选中片段，从原始K，V中提取对应片段
for i in range(batch_size):
    for j in range(t):
        for k in range(select_top_k):
            #选取每个Q对应的最大的片段
            K_slc[i, j, k * d : k * d + l, :] = K[i, idx_slc_start[i, j, k ] :  idx_slc_end[i, j, k ] , :]
            V_slc[i, j, k * d : k * d + l, :] = V[i, idx_slc_start[i, j, k ] :  idx_slc_end[i, j, k ] , :]
print(K_slc.shape) 
print(V_slc.shape) 

#处理V/K_slc为多头形式，用于分组查询注意力（GQA）
#将维度进行切分
#(batch_size,q_seq,select_top_k/v*d,dim)->(batch_size,q_seq,select_top_k/v*d,heads,head_dim)
#然后将第二个维度和第三个维度交换位置(batch_size,q_seq,heads,select_top_k/v*d,head_dim)
V_slc_mha = V_slc.view(batch_size, t, select_top_k * d, heads, head_dim).transpose(2,3)
#注意这里消除维度了(batch_size,q_seq,select_top_k/v*d,head_dim)把heads消掉了
V_slc = V_slc_mha.sum(dim = 2, keepdim = True)
print(V_slc.shape) 
K_slc_mha = K_slc.view(batch_size, t, select_top_k * d, heads, head_dim).transpose(2,3)
K_slc = K_slc_mha.sum(dim = 2, keepdim = True)
print(V_slc.shape)
#o_slc（batch_size,seq,dim）
o_slc = torch.zeros(batch_size, t, dim)
#遍历每个查询位置j
for j in range(t):
    #获取查询向量Q的多头形式
    #Q_mha: (batch_size, heads, q_seq, head_dim)->取第j个查询向量，然后取出来
    Q_slc_j = Q_mha[:, :, j, :].unsqueeze(dim = 2)
    #Q_slc_j:(batch_size,heads,1,head_dim)
    #同理，获取K/V_slc的第j个位置的键值
    #(batch_size,q_seq,select_top_k/v*d,head_dim)->(batch_size,1,select_top_k/v*d,head_dim)
    # ->然后重复(batch_size,heads,select_top_k/v*d,head_dim)
    K_slc_j = K_slc[:, j, :, :].repeat(1, heads, 1, 1)
    V_slc_j = V_slc[:, j, :, :].repeat(1, heads, 1, 1)
    #计算注意力分数:
    #(batch_size,heads,1,head_dim)@(batch_size,heads,head_dim，select_top_k/v*d)
    attn_score_j = Q_slc_j @ K_slc_j.transpose(2,3)
    #attn_score_j(batch_size,heads,1,select_top_k/v*d)
    #沿最后一个维度进行softmax计算
    p_slc_j = F.softmax(attn_score_j, dim = -1) 
    # print(p_slc.shape)
    #(batch_size,heads,1,select_top_k/v*d)@(batch_size,heads,select_top_k/v*d,head_dim)
    #==o_slc_j(batch_size,heads,1,head_dim)
    o_slc_j = p_slc_j @ V_slc_j   
    # print(o_slc_j.shape)
    #转置+合并后(batch_size,1,dim)
    o_slc_j = o_slc_j.transpose(1,2).view(batch_size, 1, dim)
    #将结果存储到o_slc的第j个位置
    o_slc[:, j, :] = o_slc_j
print(o_slc.shape)

#窗口注意力实现--提取最近特定片段的K，V
def get_window_mask(seq_len, window):
    #形状(seq,seq)
    mask = torch.ones(seq_len, seq_len)
    #将mask变成下三角矩阵（含对角线为1）
    mask = torch.tril(mask)
    #形状(seq-window,seq-window)
    win_mask = torch.ones(seq_len - window, seq_len - window)
    #将win_mask变成上三角矩阵（不含对角线）
    win_mask = 1.0 - torch.tril(win_mask)
    #选取的行索引集合window, window+1, ..., seq_len-1
    #选取的列索引集合0, 1, ..., seq_len - window - 1
    mask[window:, :seq_len - window] = win_mask
    return mask
window_mask = get_window_mask(t, 8)
print(get_window_mask(7, 3)) # test
"""
自己写一个(7,3)的模拟一下就知道最后的结果是什么样得了
tensor([[1., 0., 0., 0., 0., 0., 0.],
        [1., 1., 0., 0., 0., 0., 0.],
        [1., 1., 1., 0., 0., 0., 0.],
        [0., 1., 1., 1., 0., 0., 0.],
        [0., 0., 1., 1., 1., 0., 0.],
        [0., 0., 0., 1., 1., 1., 0.],
        [0., 0., 0., 0., 1., 1., 1.]])
    查询位置 i=0：只能关注键 j=0
    查询位置 i=1：只能关注键 j=0 和 j=1
    查询位置 i=2：只能关注键 j=0,1,2
    查询位置 i=3：只能关注键 j=1,2,3（最近的 3 个键）
    查询位置 i=4：只能关注键 j=2,3,4（最近的 3 个键）
    以此类推，对于 i>=3，每个查询只关注最近的 3 个键
"""

#这里懒得实现了，直接实现一个单头的注意力机制
#(batch_size, q_seq, dim) @ (batch_size, dim, k_seq) == (barch_size,q_seq，k_seq)
S = Q @ K.transpose(1,2) / math.sqrt(dim)
S = F.softmax(S, dim = -1)
S = S * window_mask # sliding window mask
print(S)
#(batch_size,q_seq，k_seq)@(batch_size,v_seq,dim) == (batch,q_seq,dim)
o_win = S @ V
print(o_win.shape)

#实现注意力聚合--即加权和
#W_gated(dim,3)
W_gated = torch.randn(dim, 3)
#(batch_size, t, dim)@(dim,3) == (batch_size,t,3)
gate = X @ W_gated
gate = F.sigmoid(gate)
print(gate.shape) 
o_list = [o_cmp, o_slc, o_win]
o_star = torch.zeros(batch_size, t, dim)
for i in range(3):
    #gate[:, :, i].unsqueeze(2)消掉最后一个维度后增加最后一个维度(batch_size,t,1)
    #o_list[i]:(batch_size,t,dim)
    #o_star(batch_size, t, dim)这里是加权求和
    o_star += gate[:, :, i].unsqueeze(2) * o_list[i]
print(o_star.shape)

