# Tarea 3. EAE253B

### Puntaje máximo: 30 puntos

### Entrega: jueves 4 de octubre, antes de clase

### Actividades:

##### 1) Exploración datos Casen 2017, en Python. 20 puntos.

En agosto de 2018, se publicaron los resultados de la Encuesta de Caracterización Socioeconómica Nacional (Casen) del Ministerio de Desarrollo Social, para el año 2017. Dicha encuesta tiene una alta relevancia a nivel país, ya que es una fuente importante de información para las políticas públicas que impulsa el gobierno.

La Casen se ha realizado desde el año 1990 en adelante, y en general se levanta información cada 2 años. 

El objetivo de esta Actividad será **replicar algunos cálculos de la síntesis de resultados** publicada por el Ministerio de Desarrollo Social, publicada aquí: [LINK](http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/docs/Presentacion_Sintesis_de_Resultados_Casen_2017.pdf)

Antes de comenzar:

- Descargue los datos de la encuesta Casen aquí: [LINK](http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/basedatos.php).
- Para esta actividad, utilizaremos la librería "Pandas" de Python.
- Dicha librería incluye una función llamada "read_stata", que nos permite cargar bases de datos .dta con Python. También puede descargar los datos en algún otro formato; Pandas tiene diversas funciones para leer distintos tipos de archivo.
- La encuesta Casen incluye dos variables muy relevantes llamadas "Factor de expansión" (comunal y regional). Dichas variables permiten "convertir" los datos muestrales en una versión "representativa" de la población de Chile, según el nivel de análisis que se quiera realizar (comunal o regional). Para análisis a nivel nacional, se utiliza el factor de expansión más agregado, en este caso, el factor regional.
- Para conocer las preguntas que incluyó la Casen 2017, puede ver el Cuestionario aquí: [LINK](http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/docs/Cuestionario_Casen2017.pdf)

Se le pide a Ud. que:

1. Replique el gráfico "Distribución de las personas según situación de pobreza por ingresos, 2017". ([Captura](Material/g1.png))
1. Replique el gráfico "Porcentaje de personas en situación de pobreza por región en 2017". ([Captura](Material/g2.png))
1. Replique la tabla "Porcentaje de hogares carentes en indicadores de pobreza multidimensional (2015-2017)" (solo la columna de 2017) (ver variables "hh_d_*"). ([Captura](Material/g3.png))
1. Identifique las 5 comunas con mayor incidencia de pobreza, y las 5 con menor incidencia (recuerde usar factor de expansión comunal).
1. Sin conocer cómo se construyó la variable "pobreza", ¿puede diseñar e implementar un algoritmo que le permita determinar qué variable o variables son más relevantes en la construcción de dicha variable?
1. Presente una tabla o gráfico analizando los datos de la encuesta, respecto de alguna dimensión que sea de su interés.
1. Interprete lo que muestra con su tabla o gráfico.

##### 2) Ejercicios Kattis. 10 puntos.

Realizar los siguientes ejercicios de Kattis:
- [Tarifa](https://open.kattis.com/problems/tarifa)
- [Babelfish](https://open.kattis.com/problems/babelfish)
- [Planting Trees](https://open.kattis.com/problems/plantingtrees)

### Forma de entrega:

Subir archivos .py o .ipynb a su repositorio privado en GitHub, junto con un documento en respuesta a las preguntas.
