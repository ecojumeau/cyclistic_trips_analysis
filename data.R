#Cargando librerias y paquetes 
install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(ggplot2)
library(dplyr)
library(data.table)
library(tidyr)
getwd()
setwd("C:/Users/contr/OneDrive/Documentos")

#Cargando los datasets desde el computador
nov_2021 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202111-divvy-tripdata.csv")
dec_2021 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202112-divvy-tripdata.csv")
jan_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202201-divvy-tripdata.csv")
feb_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202202-divvy-tripdata.csv")
mar_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202203-divvy-tripdata.csv")
apr_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202204-divvy-tripdata.csv")
may_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202205-divvy-tripdata.csv")
jun_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202206-divvy-tripdata.csv")
jul_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202207-divvy-tripdata.csv")
aug_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202208-divvy-tripdata.csv")
sep_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202209-divvy-tripdata.csv")
oct_2022 <- read.csv("C:/Users/contr/OneDrive/Documentos/Cyclistic Trips/202210-divvy-tripdata.csv")

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
