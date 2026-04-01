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

outfile = 'graph_line_chart.pdf'

n = 300
k = 5

m = (int)(n / k)
x = [5 * i for i in range(1, m+1)]

# array for eps_max
f = open("result.txt", "r")
emax = list(map(float, f.readline().split()))
# array for eps_avg
eavg = list(map(float, f.readline().split()))
f.close()

x = np.array(x)
emax = np.array(emax)
eavg = np.array(eavg)

ax.plot(x, emax, color="black", linewidth=4)
ax.plot(x, eavg, color="blue", linewidth=4)

plt.xticks(fontsize=30.5) 
plt.yticks(fontsize=15.5)
plt.xlabel("Dimension", fontsize=37.5)
plt.ylabel("Error", fontsize=37.5)
plt.yticks([0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4])
ax.set_xlim(0, n + 0.1)
ax.set_ylim(0, 1.5)

plt.savefig(outfile, format='pdf')

