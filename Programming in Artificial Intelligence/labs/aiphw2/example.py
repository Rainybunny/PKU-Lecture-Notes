import torch

x = torch.tensor([[-1.0, 2.0], [-3.0, 4.0], [0.0, 0.0]], requires_grad=True)
y = torch.sigmoid(torch.sigmoid(torch.relu(x)))
z = y.sum()
z.backward()

print("x:", x)
print("y:", y)
print("gx:", x.grad)
# print("gy:", y.grad)