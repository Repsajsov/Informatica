import sys
import matplotlib.pyplot as plt


dagen = []
aantallen = []
for line in sys.stdin:
    dag, aantal = line.strip().split()
    dagen.append(dag)
    aantallen.append(int(aantal))


plt.bar(dagen, aantallen)
plt.show()
