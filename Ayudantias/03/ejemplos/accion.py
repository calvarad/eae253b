#pip install msgpack
#pip install fix_yahoo_finance

import matplotlib.pyplot as plt
import fix_yahoo_finance as yf  
import datetime

fecha = datetime.datetime.now().strftime ("%Y-%m-%d")
accion = input("Sigla de la acción a buscar:")
#Opciones: AAPL, FALABELLA.SN, ...
data = yf.download(accion,'2017-01-01',fecha)
data.Close.plot()
plt.xlabel('Fecha')
plt.ylabel('Precio')
plt.title('Precio acción \n' + accion)
plt.show()