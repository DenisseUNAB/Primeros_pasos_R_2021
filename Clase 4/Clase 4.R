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



