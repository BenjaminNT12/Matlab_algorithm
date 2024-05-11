import math
import numpy as np 
import pandas as pd

K1 = 0.009
ALPHA1 = 1.7
ALPHA2 = 1.01
BETA1 = 1.3
BETA2 = 0.9
GAMMA1 = 0.1
GAMMA2 = 0.05
SIGMA1 = 0.1
SIGMA2 = 0.3
GAMMA1 = 0.005

PARAMETERS = np.array([K1,
                       ALPHA1,
                       ALPHA2,
                       BETA1,
                       BETA2,
                       GAMMA1,
                       GAMMA2,
                       SIGMA1,
                       SIGMA2,
                       GAMMA1])
# print(PARAMETERS)
# PARAMETERS = np.append(PARAMETERS, 5.6)
# print(PARAMETERS)


u_control = 0.0

W10 = np.array([[1],
                [0.5]])

W20 = np.array([[1],
                [0.5]])


ALPHA = np.array([[ALPHA1],
                  [ALPHA2]])

GAMMA = np.array([[GAMMA1],
                  [GAMMA2]])

SIGMA = np.array([[SIGMA1],
                  [SIGMA2]])

# with open('/home/nicolas/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/controlBenjamin_2023-12-14_13-35.txt', 'r') as file:
#     data = file.read()

# import pandas as pd

# Supongamos que tus datos están en un archivo de texto llamado 'datos.txt'
with open('/home/nicolas/Github/Matlab_algorithm/Pruebas/ControlBenjamin/prueba1/controlBenjamin_2023-12-14_13-35.txt', 'r') as file:
    lines = file.readlines()

# Crear listas vacías para cada columna
yaw, yaw_vel, yaw_acc, yaw_deseada, control, error = [], [], [], [], [], []

# Procesar cada línea
for line in lines:
    # Dividir la línea en palabras
    words = line.split()
    
    # Añadir los valores numéricos a las listas correspondientes
    yaw.append(float(words[1]))
    yaw_vel.append(float(words[4]))
    yaw_acc.append(float(words[7]))
    yaw_deseada.append(float(words[10]))
    control.append(float(words[12]))
    error.append(float(words[14]))

# Crear un DataFrame de pandas con los datos
df = pd.DataFrame({
    'Yaw': yaw,
    'Yaw Vel': yaw_vel,
    'Yaw Acc': yaw_acc,
    'Yaw Deseada': yaw_deseada,
    'Control': control,
    'Error': error
})

print(df[yaw])
