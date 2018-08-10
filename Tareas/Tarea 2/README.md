# Tarea 2. EAE253B


#### Plazo Entrega: jueves 30 de agosto, 17:00hrs
#### Ponderación: 30% total tareas (tareas pondera 25% total curso)
#### Puntaje máximo: 10 puntos

El objetivo de esta tarea es practicar manejo de datos con Stata y algunos conceptos de programación básicos con Python. Para completar los ejercicios de Kattis, se requiere tener instalado algún editor de texto (se recomienda utilizar [Sublime Text 3](https://www.sublimetext.com/3)).

**NO** se permite entrega grupal para esta tarea; sin embargo, se permite discutir ideas. 

**Favor señalar con qué personas del curso compartieron ideas.**

### Actividades:

#### 1) Exploración datos Censo 2017 (parte 1). 3 puntos.

Replique las tablas 2 y 4 del documento [Síntesis de Resultados Censo 2017](http://www.censo2017.cl/descargas/home/sintesis-de-resultados-censo2017.pdf). Para ello, se ha provisto a Ud. de un pequeño código de limpieza de datos, [AQUI](Material%20adicional/tarea2_aux.do) (para homologar las regiones y comunas de 2017 con las utilizadas en el informe... ver: https://www.bcn.cl/siit/actualidad-territorial/nueva-region-de-nuble)

Preguntas:
1. ¿Qué opina de las explicaciones de la Tabla 2? ¿Cómo las mejoraría?
1. ¿Qué opina de las explicaciones de la Tabla 4? ¿Cómo las mejoraría?
1. Identifique las 10 comunas con más inmigrantes (en términos relativos a la población de la comuna).

#### 2) Exploración datos Censo 2017 (parte 2). 4 puntos.

El objetivo de esta sección es realizar un pequeño análisis de movilidad social, usando los datos del Censo e información extraida (ya procesada) de la encuesta Casen 2015. En particular, la idea es mirar cómo se ha movido la población respecto de su lugar de nacimiento, y si este movimiento tiene relación con el nivel educacional de las personas.

En contreto, se pide a Ud. que estudie la transición de personas según su lugar de nacimiento (comuna de origen) y su lugar de vivienda actual (comuna de destino), considerando el ingreso promedio comunal de las comunas (de origen y destino), y las características individuales de las personas (en este caso, nivel de estudios).

Para responder las siguientes preguntas, utilice la definición de regiones y comunas de los datos originales del Censo.

Preguntas:
1. ¿Qué porcentaje de la población vive en la misma comuna donde nació?
1. ¿Qué porcentaje se ha movido a otras comunas?
1. De las personas que se han movido de comuna, ¿Qué porcentaje se ha movido a comunas cuyos ingresos promedios son superiores al ingreso promedio de la comuna de origen?
1. ¿Existe diferencia en ese porcentaje para mujeres y hombres? ¿es significativo?
1. ¿Existe diferencia en ese porcentaje para personas con distintos niveles de educación? ¿es significativo?
1. Calcule, para cada comuna del país, cuántas personas "dejaron" la comuna y cuantas "llegaron" a la comuna.
1. Indique las 10 comunas que han recibido más personas, y las 10 de las cuales se han ido más personas.
1. ¿Qué puede decir sobre la movilidad y los distintos factores analizados aquí (educación, genero, ingreso comunal)?

#### 3) Ejercicios Python. 3 puntos.

Realizar los siguientes ejercicios de Kattis:
- [R2](https://open.kattis.com/problems/r2)
- [Engineering English](https://open.kattis.com/problems/engineeringenglish)
- [Pet](https://open.kattis.com/problems/pet)

En la carpeta [Material Adicional](Material%20adicional) se encuentran archivos "base"; por favor, utilizar esos archivos base y modificar el código donde se indica.

### Recursos:

- [Datos Censo e ingresos comunales](https://www.dropbox.com/sh/tjgcxm1rg9aba15/AABYeM9EwZva-XXpi74ixRUla?dl=0)

### Forma de entrega:

Subir archivos *.do*, *.py* y/o *.ipynb* a su repositorio privado en GitHub, junto con un documento (o Markdown) con sus respuestas. 

**Favor señalar con qué personas del curso compartieron ideas.**