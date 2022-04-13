### INSISO a)

import numpy as np

#Similación del juego de la "Ruina del Jugador"
def player_ruin(a, b, p):
	cont_a = a
	cont_b = b
	sn = [a]

	i = 0
	while cont_a != 0 and cont_b != 0:
		x = 2 * np.random.binomial(1, p) - 1
		if x == 1:
			cont_a = cont_a - 1
			cont_b = cont_b + 1
		else:
			cont_a = cont_a + 1
			cont_b = cont_b - 1
		sn = np.append(sn, sn[i] + x)
		i += 1

	if cont_a == 0:
		ganador = 'B'
	else:
		ganador = 'A'
	return(sn, ganador)


#Cálculo aproximado de p.b: La probabilidad de que B arruine a A para p = 1/2  
bin = []
for i in range(1000):
	sn, g = player_ruin(10, 10, 0.5) 
	if g == 'A':
		bin = np.append(bin, 0)
	else:
		bin = np.append(bin, 1)

p_b = np.mean(bin)
print("Con p = 1/2, p.b simulado es ",p_b, " mientras el exacto es 0.5")

#Cálculo aproximado de p.b: La probabilidad de que B arruine a A para p = 0.1  
bin = []
for i in range(1000):
	sn, g = player_ruin(10, 10, p = 0.1)  
	if g == 'A':
		bin = np.append(bin, 0)
	else:
		bin = np.append(bin, 1)

p_b = np.mean(bin)
print("Con p = 0.1, p.b simulado es ",p_b, " mientras el exacto es 0")

#Cálculo aproximado de m.b: Tiempo esperado en el que B arruina a A para p = 1/2
esp = []
for i in range(1000):
	sn, g = player_ruin(10, 10, p = 0.5)
	esp = np.append(esp, len(sn))

m_b = np.mean(esp) - 1
print("Con p = 1/2, m.b simulado es " ,m_b, " mientras el exacto es 100")

#Cálculo aproximado de m.b: Tiempo esperado en el que B arruina a A para p = 0.1
esp = []
for i in range(1000):
	sn, g = player_ruin(10, 10, p = 0.1)
	esp = np.append(esp, len(sn))
    
m_b = np.mean(esp) - 1
print("Con p = 0.1, m.b simulado es " ,m_b, " mientras el exacto es 12.5")
