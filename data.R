#Cargando librerias y paquetes 
install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(ggplot2)
library(dplyr)
library(data.table)
library(tidyr)
getwd()
setwd("C:/Users/contr/OneDrive/Documentos/Cyclistic/cyclistic_analysis/")

#Cargando los datasets desde el computador
nov_2021 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2021/202111-divvy-tripdata.csv")
dec_2021 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2021/202112-divvy-tripdata.csv")
jan_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202201-divvy-tripdata.csv")
feb_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202202-divvy-tripdata.csv")
mar_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202203-divvy-tripdata.csv")
apr_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202204-divvy-tripdata.csv")
may_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202205-divvy-tripdata.csv")
jun_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202206-divvy-tripdata.csv")
jul_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202207-divvy-tripdata.csv")
aug_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202208-divvy-tripdata.csv")
sep_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202209-divvy-tripdata.csv")
oct_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic/Cyclistic Data/2022/202210-divvy-tripdata.csv")

#Explorando los datos
colnames(nov_2021)
colnames(dec_2021)
colnames(jan_2022)
colnames(feb_2022)
colnames(mar_2022)
colnames(apr_2022)
colnames(may_2022)
colnames(jun_2022)
colnames(jul_2022)
colnames(aug_2022)
colnames(sep_2022)
colnames(oct_2022)

#Estos son todos los datos para el análisis.
#A partir de ahora, se deben procesar los datos para preparar el análisis.

#Combinando todos los datasets en uno solo para hacerlo más fácil de manejar.
all_trips <- bind_rows(nov_2021,dec_2021,jan_2022,feb_2022,mar_2022,
                       apr_2022,may_2022,jun_2022,jul_2022,aug_2022,
                       sep_2022,oct_2022)

#Borrando datos innecesarios de columnas que no usaré para el análisis.
all_trips <- all_trips %>%
  select(-c(start_lat,start_lng,end_lat,end_lng))

#Confirmamos que solo hayan dos tipos de usuarios.
table(all_trips$member_casual)

#Cambiando formatos de fecha para agregar datos
all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

#Agregango columna donde se muestre la cantidad de tiempo por cada viaje.
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)
str(all_trips)

#Cambiando el tipo de dato de la columna ride_length.
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)

#Limpiando datos de espacios vacios cuando se hicieron pruebas de calidad por parte de la empresa.
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]

#Ahora comienza el análisis descriptivo de los datos 
#Realizamos un análisis descriptivo en la columna ride_length
summary(all_trips_v2$ride_length)

#Comparando los datos por cada tipo de usuario
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

#Los días de la semana están desordenados, entonces lo arreglamos
all_trips_v2$day_of_week <- format(as.Date(all_trips_v2$date), "%A")
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week,levels=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"))

#Visualizando el tiempo de viaje promedio por día se la semana y por tipo de usuario
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

#Analizando datos de usuarios por duración y día de la semana
all_trips_v2 %>%
  mutate(weekday = wday(started_at)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(),
            average_duration = mean(ride_length)) %>%
  arrange(member_casual,weekday)

#Visualizando número de viajes cada día por tipo de usuarios 
all_trips_v2 %>%
  mutate(weekday = wday(started_at)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(),
            average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.y=element_blank())
#Se puede apreciar que, en todos los días, los miembros hacen más viajes en promedio.

#Visualizando los datos por promedio del viaje
all_trips_v2 %>% 
  mutate(weekday = wday(started_at)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")
#En promedio los usuarios casuales hacen viajes más largos en toda la semana.


counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
write.csv(counts, file = "C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/all_trips_v2")

