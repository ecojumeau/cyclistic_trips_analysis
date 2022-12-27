# Cyclistic Trips Analysis
## Introduction
Este análisis es el resultado de completar el [Google Data Analytics Certificate](https://www.coursera.org/account/accomplishments/specialization/certificate/TD7JQAXDVYUY). A continuación verás el proceso de análisis de los datos para la empresa Cyclistic **(el nombre de la empresa se cambio por privacidad).**

Puedes ejecutar el notebook completo en [Kaggle](https://www.kaggle.com/code/ecozamb/cyclistic-trips-analysis#Analyse).

Comenzamos a realizar el análisis a través de todas las fases:

## Ask
###### Tarea empresarial

Cyclistic es una empresa que ofrece servicios de Bike-Sharing en la ciudad de Chicago. Ofrece tres productos: Pase para viaje, pase diario y membresía anual, las personas que adquieren los primeros dos servicios se consideran usuarios casuales mientras que los últimos se consideran miembros. Aproximadamente el 8% de usuarios usan los productos de asistencia que son para personas con discapacidades y el 30% de usuarios usan los servicios para ocio, el resto para transportarse diariamente al trabajo. La empresa entendió que el producto que más les trae rentabilidad son las membresías anuales, por eso quieren averiguar y entender cómo los miembros anuales y los ciclistas casuales usan los productos y servicios de diferente manera. Aunque el equipo de marketing de Cyclistic sabe que puede crear campañas para llegar a nuevos clientes, entienden que volver los ciclistas casuales a miembros anuales puede ser clave para el futuro de la compañía. Para esto se van a basar en la data de la empresa para encontrar patrones en el comportamiento de los usuarios y así crear compañas de marketing más asertivas.

###### Objetivo del análisis

Identificar patrones de comportamiento para entender de qué manera los miembros anuales usan de diferente manera el servicio en comparación a los usuarios casuales con el fin de hacer que estos últimos adquieran una membresía anual.

***Stakeholders Principales:*** Cyclistic Executive Team and Lily Moreno (Director of Marketing).

***Stakeholders secundarios:*** Cyclistic Marketing Analytics Team.

## Prepare
###### Descripción de los datos usados

Los datos fueron extraídos de Divvy Historical Trip Data. Un total de 12 datasets fueron descargados de noviembre 2021 hasta octubre 2021, contienen información de los viajes de los usuarios y fue limpiada para no contener información personal de los mismos. Estos datos fueron referenciados y accesibles gracias a Motivate International Inc. bajo esta licencia.

###### Problemas de privacidad, sesgo y credibilidad

La privacidad de los datos prohíbe usar la información personal de los usuarios. Esto significa que no está permitido conectar compras anteriores con tarjetas de crédito para determinar si los usuarios viven en la zona de servicio de Cyclistic o si han realizado múltiples compras.

## Process
Documentación, limpieza y preparación de los datos para el análisis

El tamaño de los datasets hace que manipular los datos en Excel se dificulte bastante, esto puede consumir bastante tiempo a comparación de SQL o R. Por ese motivo usaré R ya que puedo analizar y crear las visualizaciones en un solo lugar con RStudio.

[Aquí](https://github.com/ecojumeau/cyclistic_trips_analysis/blob/master/data.R) consigues todo el código del estudio.

## Analyse
Como podemos ver abajo, durante los meses en los que se realizó el análisis hubieron más miembros anuales que usuarios casuales. Poco más de un millón de usuarios. Los miembros representan el 59,12% mientras que los usuarios casuales representan el 40,88%.

![](https://raw.githubusercontent.com/ecojumeau/cyclistic_trips_analysis/master/charts/Amount%20of%20users.png)

Aquí vemos el tiempo de viaje promedio por día de la semana y por tipo de usuario.

![](https://raw.githubusercontent.com/ecojumeau/cyclistic_trips_analysis/master/charts/Trip%20duration%20per%20weekday.png)

Analizando datos de usuarios por duración y día de la semana.

![](https://raw.githubusercontent.com/ecojumeau/cyclistic_trips_analysis/master/charts/Number%20of%20rides%20and%20average%20duration.png)

## Share
Visualizando número de viajes cada día por tipo de usuarios

![](https://raw.githubusercontent.com/ecojumeau/cyclistic_trips_analysis/master/charts/Trips%20by%20customers%20per%20weekday.png)

*Podemos ver que durante los 12 meses en casi todos los días de la semana los miembros son los que hacen más viajes.*

Ahora vamos a visualizar el promedio del viaje.

![](https://raw.githubusercontent.com/ecojumeau/cyclistic_trips_analysis/master/charts/Trip%20duration%20by%20customer%20per%20weekday.png)

*Como podemos ver, los usuarios casuales hacen viajes más largos durante toda la semana.*

## Act
Realicé el análisis de los datos durante 12 meses y en el proceso pude descubrir varios puntos a resaltar. Cabe mencionar que si se tuvieran datos sobre costos de pases y membresías se podrían sacar mejores concluciones y recomendaciones para el equipo de marketing:

* Hay más miembros anuales que usuarios casuales.
* Los miembros anuales hacen más viajes durante la semana.
* En promedio, los usuarios casuales hacen viajes más largos en la semana.

En base a estos hallazgos puedo hacer la siguientes recomendaciones:

1. Hacer campañas de marketing mostrando los beneficios y facilidades que pueden tener los usuarios al adquirir una membresía anual.
2. Generar nuevos beneficios para retener a clientes actuales.
3. Crear un descuento especial para nuevas membresías anuales para incentivar a los usuarios casuales.