# Tarea 4. EAE253B

### Puntaje máximo: 30 puntos

### Entrega: viernes 23 de noviembre

### Grupos: máximo 3 personas.

### Reglas de Asociación: Análisis Canasta de Mercado. 30 puntos.

Las reglas de asociación son una herramienta utilizada para describir, en términos estadísticos, qué elementos ocurren con mayor frecuencia de forma conjunta en una canasta de elementos. Una de las aplicaciones más tradicionales de las reglas de asociación es su uso en el **"análisis de canasta de mercado"**. Dicho análisis busca establecer qué productos de una tienda de retail o supermercado se venden más frecuentemente de forma conjunta, para poder establecer estrategias de *pricing* o de *marketing* utilizando la información de las reglas. En esta tarea crearemos reglas de asociación básicas a partir de información de ventas de una panadería.

#### Antes de partir

- Descargue los datos de la tarea acá: https://www.dropbox.com/s/1baef1cp37ifmed/datosCanasta.csv?dl=0
- Conceptos de reglas de asociación acá: https://en.wikipedia.org/wiki/Association_rule_learning

#### Antecedentes iniciales

Considere los siguientes datos de ejemplo:

| ID Transacción	| Itemes Comprados |
| --- | --- |
| t1	|{T-shirt, Trousers, Belt}|
| t2	|{T-shirt, Jacket}|
| t3	|{Jacket, Gloves}|
| t4	|{T-shirt, Trousers, Jacket}|
| t5	|{T-shirt, Trousers, Sneakers, Jacket, Belt}|
| t6	|{Trousers, Sneakers, Belt}|
| t7	|{Trousers, Belt, Sneakers}|

Las mejores reglas de asociación se determinan de manera estadística analizando los siguientes conceptos:


- **Support**:  es una indicación de qué tan frecuente ocurren los ítemes de la regla (X ⇒ Y) en forma conjunta en los datos. Se define como:

Supp(X⇒Y) = Freq(X U Y) / n

Donde Freq(X U Y) es el número de veces que los ítemes X e Y ocurren de manera conjunta en una transacción (pueden haberse adquirido junto con otros ítemes), y *n* es el número de transacciones totales.  

En general, las reglas con valores de Support bajos no son útiles.  

Con los datos de la tabla anterior, se puede calcular el Suporte de diversas reglas, por ejemplo:

Supp(T-shirt⇒Trousers) = 3/7 = 43%

Esto, ya que hay 3 transacciones que incluyen *T-shirt* y *Trousers* dentro de los ítemes comprados. Veamos otro ejemplo:

Supp({T-shirt,Trousers}⇒{Belt}) = 2/7 = 28%

Mirar Support por si solo no es tan útil, ya que esta medida da más peso a ítemes que se transan más en términos absolutos. Por eso, es necesario mirar otras medidas adicionales:

- **Confidence**: muestra el porcentaje en que el ítem Y se compra en forma conjunta con los ítemes X, respecto de la frecuencia relativa de X.

Conf(X⇒Y) = Supp(X ⇒ Y) / Supp(X)

Veamos un ejemplo:

Conf({T-shirt,Trousers}⇒{Belt}) = (2/7) / (3/7) = 66%

- **Lift**: El "Lift" de una regla es el ratio del Support observado al Support esperado si los ítemes X e Y ocurrieran de manera independiente en los datos. Se define como:

Lift(X⇒Y) = Supp(X⇒Y) / (Supp(X) * Supp(Y))

Mayores valores de lift indican mayor asociación entre X e Y. Con los datos del ejemplo:

Lift({T-shirt,Trousers}⇒{Belt}) = (2/7) / ((3/7) * (4/7)) = 1.17

- **Conviction**: "Conviction" es el ratio de la frecuencia esperada de que X ocurra sin Y si X e Y fueran independientes, dividido por la frecuencia observada de predicciones incorrectas. Un valor alto significa que el consecuente (Y) depende fuertemente del antecedente (X). Se define como:

Conv(X⇒Y) = (1 − Supp(Y)) / (1 − Conf(X⇒Y))

Por ejemplo:

Conv({T-shirt,Trousers}⇒{Belt}) = (1 − (4/7)) / (1− (2/3)) = 1.28 

#### 1) Estadísticas descriptivas de ventas (10 puntos)

1. Calcule el número de registros de la base de datos.
1. Calcule el número de transacciones que hay en la base de datos.
1. Calcule el número de productos distintos que hay en la base de datos.
1. Calcule cuántas transacciones por mes se observan en la base de datos.
1. Calcule otras estadísticas descriptivas que le parezcan relevantes.

#### 2) Cálculos para crear reglas (20 puntos)

1. Escriba una función que tome sus datos, una lista de ítemes correspondientes a X e Y, y calcule el Support de la regla X ⇒ Y. (*Note que Supp(X ⇒ Y) = Supp(Y ⇒ X)*).
1. Escriba una función que tome sus datos, una lista de ítemes correspondientes a X, el nombre de un ítem Y, y calcule el Confidence de la regla X ⇒ Y.
1. Escriba una función que tome sus datos, una lista de ítemes correspondientes a X, el nombre de un ítem Y, y calcule el Lift de la regla X ⇒ Y.
1. Escriba una función que tome sus datos, una lista de ítemes correspondientes a X, el nombre de un ítem Y, y calcule el Conviction de la regla X ⇒ Y.

*Ayuda: Se recomienda que, antes de pasar los datos a dichas funciones, se haga un preprocesamiento de la base de datos para poder calcular más fácilmente las estadísticas requeridas. Lo clave es poder facilitar el cálculo del valor Freq(X U Y).*

#### 3) Modelo de reglas (Bono 5 puntos para prueba)

Conceptualmente, para crear un modelo basado en reglas deberíamos evaluar todas las reglas (X ⇒ Y) posibles y estimar, al menos, el Support y Confidence de cada una (son las medidas más utilizadas, pero también se puede mirar Lift y Conviction).

En esta tarea, para simplificar el proceso, nos centraremos en reglas "simples" sólo con dos ítemes (por ejemplo, la regla *T-shirt⇒Trousers*).

Iterando sobre todos los posibles pares de ítemes, se le pide:

1. Identifique las 5 reglas con mayor Support. 
1. Identifique las 5 reglas con mayor Confidence.
1. Identifique las 5 reglas con mayor Lift.
1. Identifique las 5 reglas con mayor Conviction.
1. Interprete una de estas reglas (haciendo referencia a las 4 estadísticas para ella).

### Forma de entrega:

Subir archivos a su repositorio privado en GitHub, junto con un documento en respuesta a las preguntas.
