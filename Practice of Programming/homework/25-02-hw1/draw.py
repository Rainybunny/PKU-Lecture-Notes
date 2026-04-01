import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

plt.rcParams['axes.unicode_minus'] = False
fig=plt.figure(figsize=(14, 8))
ax = fig.add_subplot(50,1,(1,49))
ax.grid(linestyle = "--")
ax.spines['top'].set_visible(False) 
ax.spines['right'].set_visible(False)

filename = 'res.txt'
outfile = 'dynamic_averaging.pdf'
f = open(filename, "r")
res = []
n = 5000
fin = 0
presum = 0

for i in range(n):
	cur = int(f.readline())
	presum += cur; fin = max(fin, cur)
	res.append(presum / (i + 1))

x = np.array(range(1, n + 1))

res = np.array(res)
bst = np.ones_like(x) * fin

ax.plot(x, res, color="black", linewidth=4)
ax.plot(x, bst, color="red", linestyle = "dashed", linewidth=4)

plt.xticks(fontsize=30.5) 
plt.yticks(fontsize=15.5)
plt.xlabel("Trial", fontsize=37.5)
plt.ylabel("Average", fontsize=37.5)
plt.yticks([0,1475000,1476250,1477500, 1478750, fin, 1480000])
plt.gca().get_yticklabels()[5].set_color('red')
ax.set_xlim(0, n + 0.1)
ax.set_ylim(1475000, 1480000)
ax.ticklabel_format(style='plain', useOffset=False, axis='y')

plt.savefig(outfile, format='pdf')

