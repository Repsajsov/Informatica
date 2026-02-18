import sys
import matplotlib.pyplot as plt

# Stuur alle stdin naar lists die plt.bar goed kan lezen
dagen = []
aantallen = []
for line in sys.stdin:
    dag, aantal = line.strip().split()
    dagen.append(dag)
    aantallen.append(int(aantal))


# Maak de grafiek
plt.bar(dagen, aantallen)

# Laat de grafiek zien
plt.show()
