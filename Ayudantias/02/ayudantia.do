********************************************************************************
*** Ayudantía 2 - EAE253B: Economía y Ciencia de los Datos
********************************************************************************
*** Temas a ver:
* Cambio de directorio
* Uso de globales y locales
* Creación de un log
* Cómo recuperar datos de regresiones u otros comandos
* Importar paquetes 
* Exportar gráficos como imágen
* Guardar db y exportar datos

//------------------------------------------------------------------------------

***Aspectos más relevantes 
* Carga datos (dta y txt)
* Filtros y seleccion de variables
* Merge
* Collapse
* Reshape
* Ejemplo Python con el mismo txt
* Revisar estos temas posteriormente en Python

********************************************************************************




* ============================================================================
*  Header - Versiones de Stata, globales y creación de un log.
* ============================================================================

clear
version 12
set more off
cap log close

global data  "C:\Users\pablo\Desktop\ayudantia\eae253b\Ayudantias\02\data"
global junk  "C:\Users\pablo\Desktop\ayudantia\eae253b\Ayudantias\02\junk"
global extra "C:\Users\pablo\Desktop\ayudantia\eae253b\Ayudantias\02\bdalternativa"
global log "C:\Users\pablo\Desktop\ayudantia\eae253b\Ayudantias\02\log"


//Definimos un log
cd "$log"
capture log close // cerramos cualquier log anterior
log using "ayudantia.log", text replace 




* ============================================================================
*  Carga datos (dta y txt)
* ============================================================================

cd "$data"
use ucla.dta,clear // Como importar archivo .dta
import delimited ucla.txt, clear //Como importar archivo .csv o .txt
// insheet using "ucla.txt", tab clear   (para la versión 12)


* ============================================================================
*  Describiendo los datos
* ============================================================================

//Resumir las variables
syntax [varlist]
foreach var of local varlist{
sum  `var'
}

// Alternativamente
foreach var of varlist *{
sum  `var'
}

//Si queremos resumir algo, dado var=x
qui levelsof rank, local(levels)
foreach i of local levels {
sum admit gre if rank== `i'
}

//Otra alternativa sería inspeccionar la variable
foreach var of varlist *{
inspect  `var'
}
 
				
* ============================================================================
*  Filtros y seleccion de variables
* ============================================================================

br //Browse: Fijarse en "Filter observations"
sort rank
by rank: sum(gpa)
bysort rank: sum(gpa)
sort id

/* Operadores:
Operadores Relacionales: Nos permiten comparar todo tipo de valores y generar 
nuevos valores lógicos que puedn ser TRUE(1) o FALSE(0). Estos operadores son: 
== (igual a),!=(distinto de), >=(mayor o igual a), >(mayor a), 
<=(menor o igual a) o <(menor a).
Operadores lógicos: Nos permiten combinar valores lógicos a otros valores
lógicos. Estos son "&"(y), "|"(o) y "!"(No).
*/

* Veamos rápidamente nuestra variable dependiente 
codebook admit
fre admit

* Ahora las variables independientes
codebook gpa gre rank, compact

* Cómo podemos ir filtrando 
tab admit if gpa > 3.8
tab admit if gre>750 & rank<=2
tab admit if rank!=1 & gpa>=4






* ============================================================================
*  Append, Merge y Collapse
* ============================================================================


* Importamos base de datos: El objetivo es expandirla a como era antes.
use id admit gre rank if _n < 100 using ucla.dta, clear



//Append: Nos permite agregar observaciones a la bd actual
append using append.dta.
/*
Importante: Si la base de datos actual y la que vamos a usar contienen
variables que no existen en la otra, las obervaciones serán ajustadas
como "."
El tipo de varialbe de la bd actual se prioriza sobre el de la bd que usaremos
para expandir nuestros datos. Hay que tener cuidado, porque esto puede generar
errores.
*/



/* Merge: Nos permite añadir variables a nuestra base de datos.
Forma: merge x:y var1 var2 using ".../usar.dta", donde x e y corresponden
a la cantidad de variables en la base de datos maestra y en la de extensión 
respectivente y var1 y var2 son variables presentes en ambas.
*/
merge m:1 id using merge.dta, nogenerate //Nos permite agregar variables
/*
El comando merge genera una nueva variable a menos que le indique lo contrario
(nogenerate). Esta variable te notifica el resultado de la operación:
_merge=1 : Observaciones de la bd actual que no coincidieron con ninguna
obsevacion de la base ded datos seleccionada.
_merge=2 : Observaciones de la base de datos seleccionada que no coincidieron
con las de la base de datos actual (bd maestra).
_merge=3 : Observaciones sin problemas.

Una vez realizado el proceso, los datos se ordenarán en base a la variable 
merge (3,1,2).
* Generalmente se recomienda usar el comando: keep if _merge==3 , para evitar
problemas posteriores.
*/



/*
Collapse convierte nuestros detos en un set de estadísticas como sumas, medias,
mediatanas, etc. Es importante tener en cuenta dos aspectos de este
comando: Los valores faltantes serán tratados como ceros (hay que tener
cuidado) y los datos previos serán sobreescritos (lo que se puede prevenir).
*/
preserve
collapse (mean) admit_medio=admit gpa_medio=gpa gre_medio=gre ///
		 (sum)  sadmit=admit sgpa=gpa sgre=gre, by(rank)	  
list


/*
Reshape
reshape wide newvar, i(var1) j(var2) Transforma bd de formato largo a ancho.
reshape long newvar, i(var1) j(var2) Transforma bd de formato ancho a largo.
*/
webuse reshape1,clear //Nos permite utilizar bases de datos default.
reshape long inc ue, i(id) j(year)
list, sepby(id) //Lista nuestros datos, separándolos por id.
webuse reshape6,clear
list, sepby(id)
reshape wide inc ue, i(id) j(year)
list
/*
newvar contiene los datos que queremos remodelar.Si usas reshape long, esta
variable no existirá y será generada. STATA va a remodelar todas las
variables que empiezan con newvar. 
La variable i() especifica la variable única en formato ancho, mientras
que j() ese requerida para lo mismo en formato largo.
Nota: Si j() está en formato "string", debes escribir string al final de tu
comando.
*/






* ============================================================================
*  Logistic Regression
* ============================================================================
* Queremos predecir la admición usando estas variables predictoras.
import delimited ucla.txt, clear //Re-importamos la bd.


logit admit gre gpa i.rank 
// Alternativamente: logistic admit gre gpa i.rank, coef  (o sino reporta radios)


* Model fit 
estat classification // 71% Correctamente clasificados.


* Marginal Effects and predicted probabilities
margins, at(gpa=(3(0.1)4)) vsquish // vsquish adds a small formatting improvement
marginsplot, yline(0)






* ============================================================================
*  Trucos con Stata
* ============================================================================

//Antes de guardar la base de datos, veamos como etiquetar las variables.
label var admit "Aceptación"
label var gre "Puntaje exámen GRE"
label var gpa "Promedio General Acumulado"
label var rank "Posición ranking"

//Agreguemos una descripción a los números.
label define admision 0 "rechazado" 1 "admitido"
label values admit admision

//Instalar paquetes
ssc install estout, replace
tabstat ( gpa gre rank ), stats(mean max min) save


* Volvemos a realizar la regresión.
logit admit gre gpa i.rank 

ereturn list //Recuperar datos desde una regresión

di in red "El coeficiente de gre es " _b[gre] ///
		  " y el coeficiente es " _b[_cons]

		  
//Trabajo con matrices
matrix def b = e(b)
mat li b
display b[1,2]
display el(b, 1, 2)




* ============================================================================
*  Finalizando un archivo
* ============================================================================


//Guardamos la base de datos modificada en otra carpeta
cd "$junk"
save "editado.dta", replace //No usar como .csv o .txt
//saveold "", version(12)  - Sirve para versiones anteriores (como la de la facultad)
export delimited id admit gre rank using "modificada.txt", delimiter (tab) replace
export delimited id admit gre rank using "modificada.csv", delimiter (tab) replace

log close
exit








* ============================================================================
*  Si hay tiempo: Datos más complejos
* ============================================================================

//Presentación de datos
cd "$extra"
use "ches.dta",replace // load the data
br

ssc install estout, replace
quietly regress  eu_position lrgen
estimates store m1, title(Model 1)
quietly regress  eu_position lrecon
estimates store m2, title(Model 2)
quietly regress  eu_position lrecon galtan new_ms
estimates store m3, title(Model 3)
quietly regress  eu_position lrecon galtan new_ms immigrate_policy
estimates store m4, title(Model 4)

esttab m1 m2 m3 m4, ar2 se star(* .05) b(a2) //Imprimir en stata


cd "$junk"
//Exportamos la tabla.
esttab m1 m2 m3 m4 using "full_model.rtf", ///
se rtf r2 ar2 label replace title("Estimated parties' positions on EU integration") nonumbers ///
mtitles("Model 1" "Model 2" "Model 3" "Model 4") /// 
addnote("Source: CHES_2014.dta") modelwidth(5) compress



//Para exportar gráficos:
qui reg eu_position lrecon galtan new_ms immigrate_policy
predict resid_full, resid

twoway (scatter resid_full lrecon, yline(0))(lowess resid_full lrecon, color("green")) , ///
		legend(off) saving(lrecon, replace)
twoway (scatter resid_full galtan, yline(0))(lowess resid_full galtan, color("green")) , ///
		legend(off) saving(galtan, replace)
twoway (scatter resid_full immigrate_policy, yline(0))(lowess resid_full immigrate_policy, color("green")), ///
		legend(off) saving(immigrate_policy, replace)

graph combine lrecon.gph galtan.gph immigrate_policy.gph, col(2) row(2)
graph export grafico.png, replace




