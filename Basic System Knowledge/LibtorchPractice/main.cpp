#include <torch/torch.h>
#include <iostream>
#include <vector>

int main() {
    auto tensor = torch::rand({1,2,3,5});
    tensor = tensor.view({tensor.size(0), -1});
    tensor = tensor.contiguous();
    std::vector<float> v(tensor.data_ptr<float>(), tensor.data_ptr<float>() + tensor.numel());
    std::cout << "v.size() = " << v.size() << std::endl;
    return 0;
}
