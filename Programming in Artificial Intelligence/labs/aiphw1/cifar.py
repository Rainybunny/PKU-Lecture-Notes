import torch
import torchvision
import torchvision.transforms as transforms
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.tensorboard import SummaryWriter

batch_size = 128
transform = transforms.Compose([
    transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
])
trainset = torchvision.datasets.CIFAR10(
    root='./data', train=True, download=True, transform=transform
)
testset = torchvision.datasets.CIFAR10(
    root='./data', train=False, download=True, transform=transform
)
trainloader = torch.utils.data.DataLoader(
    trainset, batch_size=batch_size, shuffle=True, num_workers=2
)
testloader = torch.utils.data.DataLoader(
    testset, batch_size=batch_size, shuffle=False, num_workers=2
)
writer = SummaryWriter()

class LeNet(torch.nn.Module):
    def __init__(self):
        super(LeNet, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = torch.flatten(x, 1)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

model = LeNet()
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.025, momentum=0.97, weight_decay=1e-3)
device = torch.device("cuda")
model.to(device)
epochs = 10

def train_model():
    model.train()
    for epoch in range(epochs):
        current_loss = 0.0
        current_correct = 0
        total = 0
        for i, (x, yhat) in enumerate(trainloader):
            x, yhat = x.to(device), yhat.to(device)
            optimizer.zero_grad()
            y = model(x)
            loss = criterion(y, yhat)
            loss.backward()
            optimizer.step()
            _, predicted = torch.max(y.data, dim=1)
            total += yhat.size(0)
            current_correct += (predicted == yhat).sum().item()
            accuracy = 100 * current_correct / total
            writer.add_scalar('Loss/Train', loss, epoch * len(trainloader) + i)
            current_loss += loss.item()
        print(f'epoch {epoch}'
              f' | loss {current_loss / len(trainloader)}'
              f' | acc {accuracy:.3f}%')
    print('Finished Training')
    torch.save(model.state_dict(), './cifar_lenet.pth')
    writer.flush()

def test_model():
    model.eval()
    all_total = 0
    all_correct = 0
    with torch.no_grad():
        # for x, yhat in testloader:
        #     x, yhat = x.to(device), yhat.to(device)
        #     y = model(x)
        #     _, predicted = torch.max(y.data, dim=1)
        #     total[yhat] += yhat.size(0)
        #     correct[yhat] += (predicted == yhat).sum().item()
        for yhat in range(10):
            total = 0
            correct = 0
            for x, labels in testloader:
                x, labels = x.to(device), labels.to(device)
                mask = (labels == yhat)
                if mask.sum().item() == 0:
                    continue
                y = model(x[mask])
                _, predicted = torch.max(y.data, dim=1)
                total += mask.sum().item()
                correct += (predicted == labels[mask]).sum().item()
            print(f'Class {yhat} | Accuracy: {100 * correct / total:.3f}%')
            all_total += total
            all_correct += correct
    print(f'Overall Accuracy: {100 * all_correct / all_total:.3f}%')

train_model()
test_model()
writer.close()