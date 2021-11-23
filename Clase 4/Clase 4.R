# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 4
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_4.html

# install.packages("naniar")

library(tidyverse)
library(skimr)
library(naniar)
library(janitor)


Tabla1 <- tibble(`Nombre de variable` = 1:100,
                 hola = 1:100)

Tabla1 <- tibble(Nombre_variable = 1:100,
                 hola = 1:100)


file.choose()
df <- readxl::read_excel("G:\\Mi unidad\\Diplomado\\Bases de datos\\Encuesta nacional de salud.xlsx")

df %>% 
  clean_names() %>% 
  View()

# Paquete string ====================

df <- readxl::read_excel("SEA_projects.xlsx",skip = 2)

df$proyecto %>% str_detect("Aeropuerto")

df_aeropuerto <- df %>% 
  filter(proyecto %>% str_detect("Aeropuerto"))

df %>% 
  filter(proyecto %>% str_detect("Personas"))

df <- df %>% 
  mutate(proyecto = str_to_lower(proyecto)) 

df %>% 
  filter(proyecto %>% str_detect("aeropuerto"))


str_extract("Kia morning 2021","[:digit:]")
str_extract_all("Kia morning 2021","[:digit:]")


str_remove_all("Kia morning 2021"," ")
str_remove_all("Feliz día del niño","ñ")

str_remove_all("Kia morning 2021","[:digit:]")


str_replace("Kia morning 2021","Kia","Kia Motor")

str_replace_all("El día del niño, lo celebramos en Nuñoa","ñ","n")

openxlsx::write.xlsx(df,file = "Base de prueba.xlsx")


df %>% 
  mutate(proyecto = str_replace_all(proyecto,"aeropuerto","tren")) %>% 
  View()

# Fechas ============

'18-11-2021' %>% 
  as.Date(format = "%d-%m-%Y") %>% 
  format("%d %B, %Y")


df %>% glimpse()
df %>% str()

df %>% 
  mutate(fecha_entrada = format(fecha_entrada,"%d %B - %Y")) %>% 
  View()

Sys.Date() %>% format("%A %d %B, %Y")

## Paque lubridate
library(lubridate)

Sys.Date() %>% format("%d %B, %Y")


"18 noviembre, 2021" %>% as.Date("%d %B, %Y")
"18 noviembre, 2021" %>% dmy() %>% week()

# Paquete Skimr

df %>% 
  skim()

df %>% 
  focus()


# Paquete naniar

df %>% 
  n_miss()

df %>% 
  n_complete()

prop_miss(df)/pct_miss(df)


df %>% 
  miss_var_summary()



df %>% vis_miss()

datos::aviones

gg_miss_fct(datos::aviones, fct = tipo_motor)


# Factores ===========

sexo <- c(1,0,0,0,0,0,1,1,1,0,0,1)
sexo %>% as.character()
sexo %>% factor() %>% summary()

sexo %>% factor(levels = c(0,1),labels = c("Hombre","Mujer"))
sexo %>% factor(levels = c(1,0),labels = c("Mujer","Hombre"))

# Taller =========
rm(list = ls())

library(readxl)
df <- read_excel("SEA_projects.xlsx", skip = 2)

## a. ----
# Remueva las columnas y filas que solo contengan datos perdidos.

df <- df %>% 
  remove_empty(which=c('rows','cols'))

df %>% 
  miss_var_summary()

df %>% 
  filter(!is.na(empresa))

## b. ----
# Verifique que el formato de las variables y realice los cambios de formatos que sean necesarios.

df %>% glimpse()

df <- df %>% 
  mutate(tipo = factor(tipo),
         estado = factor(estado),
         fecha_entrada = ymd(fecha_entrada),
         fecha_calificacion = ymd(fecha_calificacion)) 

## c. ----
# Obtenga un resumen de la base de datos, ¿En promedio cuantos millones de dólares se invierten en los proyectos de Chile?

skim(df)
# 28 millones de dolares en proyectos

## d. ----
# Realice un estudio de los datos faltantes (Na’s) en las distintas variables, ¿Qué proporción de Na’s se tiene para las distintas variables?

df %>%
  miss_var_summary()

## e. ----
# Realice un análisis gráfico de los Na’s de las distintas variables segregado por los distintos estado de la variable estado. ¿A que se deben estos resultados?, comente.


gg_miss_fct(df, fct = estado)
