# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 3
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_3.html

library(tidyverse)


Tabla1 <- data.frame(ID = 1:100,
           Numero = rnorm(100),
           Sexo = rbinom(100, 1, 0.4))

# obtener las primas 10 filas de Tabla 1
Tabla1 %>% head(10)

# Obtener las x ultimas filas de Tabla 1
Tabla1 %>% tail(7)

# Filas y columnas de Tabla 1
Tabla1 %>% dim()

# Número de columnas
Tabla1 %>% length() # utilizar ncol()
Tabla1 %>% ncol()

# Número de fila
Tabla1 %>% nrow()

# Nombre de las variables (de las columnas)
Tabla1 %>% names()

# Seleccionar variable 
Tabla1
Tabla1$Sexo
Tabla1[,"Sexo"]
Tabla1 %>% select(Sexo)

# Taller practico ----

install.packages("datos")
library(datos)

paises %>% head(5)
paises %>% tail(10)
paises %>% dim()  
paises %>% ncol()  
paises %>% nrow()  
paises %>% names()  

# Tibble ----
library(dplyr)

Tabla2 <- tibble(ID = 1:100,
                     Numero = rnorm(100),
                     Sexo = rbinom(100, 1, 0.4))


# Importar y exportar bases de datos ----


library(readxl)
library(data.table)

# Obtener una ruta de archivo
file.choose()

# Importar un Excel
viviendasRM <- readxl::read_excel("viviendasRM.xlsx", sheet = "viviendasRM")

# Cargar un csv con las funciones básicas
sale1 <- readr::read_csv("C:\\Users\\diego\\Desktop\\Sales.csv")

# Cargar un csv de gran tamaño de forma eficiente
sale2 <- data.table::fread("C:\\Users\\diego\\Desktop\\Sales.csv") %>% 
  tibble()

## Exportar ----

Tabla3 <- sale2 %>% 
  slice(1:1000)

library(openxlsx)

# Exportyar en Excel
openxlsx::write.xlsx(Tabla3,
                     "Base de datos procesada.xlsx",
                     overwrite = TRUE,
                     asTable = TRUE)

# Exportar en formato R
save(Tabla3,file = "Base de datos en R.Rdata")
load("Base de datos en R.Rdata")

# Exportar en csv
# libreria data.table

fwrite(Tabla3,"Tabla en formato csv.csv", append = TRUE)


# Análisis exploratorio ----

Tabla1 %>% glimpse()

skimr::skim(Tabla3)

