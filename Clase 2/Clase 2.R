# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 2
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_2.html

library(tidyverse)
library(dplyr)



X <- matrix(rnorm(100), nrow = 10)

X[3,]
X[,c(2,5)]
X[c(1,4,10), ]
X[1:5,  ]

Mi_matriz <- matrix(1:100, nrow = 10)
Mi_matriz

Tabla1 <- data.frame(Nombres = c("Diego","Paolo","Javiera","Camila","Felipe"),
                     Edad    = c(24,30,50,55,60),
                     Altura  = c(180,160,175,155.5,160))

Tabla1

poleras <- c(254,203,182,50)
meses   <- c("Ene", "Feb", "Mar", "Abr")

ventas <- data.frame(poleras,meses)
ventas

ventas$poleras
ventas$meses

barplot(ventas$poleras,  names.arg = ventas$meses)

ventas[c(1,4), c("meses","poleras")]
ventas$poleras[2:3]


Tabla2 <- tibble(Nombres = c("Diego","Paolo","Javiera","Camila","Felipe"),
                 Edad    = c(24,30,50,55,60),
                 Altura  = c(180,160,175,155.5,160))





tib_ejemplo <- tibble(
  nombre = c("Claudio", "Javiera", "Elias", NA, "Camila"),
  valor = c(10, NA, 7, NA, 15)
)
str(tib_ejemplo)


na.omit(tib_ejemplo)

c(1,4,6,7,NA,10)


sum(tib_ejemplo$valor)
sqrt(-10)

vec <- LETTERS[1:5]
mat <- matrix(1:9, ncol = 3)
lista <- list("Elemento_1" = vec,
              "Elemento_2" = mat,
              "Elemento_3" = tib_ejemplo)

lista$Elemento_3$nombre



Tabla2 <- Tabla2[Tabla2$Edad > 35, ]

Tabla2 %>% 
  filter(Edad > 35, Altura > 170) %>%  # Se crea un filtro
  mutate(Peso = c(60,80))              # Se crea una variable



library(readxl)

# opción 1
viviendas <- read_excel("viviendasRM.xlsx", 
                        sheet = "viviendasRM") 
viviendas <- as_tibble(viviendas)

# opción 2
viviendas <- read_excel("viviendasRM.xlsx", 
                        sheet = "viviendasRM") %>% 
  as_tibble()

# ACTIVIDAD 1 ----
viviendas <- read_excel("viviendasRM.xlsx", 
                        sheet = "viviendasRM") %>% 
  as_tibble()

## Toda la información del cuarto registro. ----

# opción 1
viviendas[4,]
# opción 2
viviendas %>% 
  slice(4)

## El número de baños de la vivienda del registro 8 ----

names(viviendas)

# opción 1 
viviendas[8,5]

# opción 2
viviendas %>% 
  select(N_Banos) %>% 
  slice(8)

## El numero de estacionamientos de la vivienda 14. ----

viviendas %>% 
  select(N_Estacionamientos) %>% 
  slice(14)

viviendas[14,6]
 
## Total de superficie M2 y valor en UF, para las viviendas desde la quinta a la décima posición. ----

viviendas %>% 
  select(Total_Superficie_M2,Valor_UF) %>% 
  slice(5:10)

## Listado de superficie M2, corredor y valor en UF de viviendas cuya superficie M2 es igual a 100 m2. ----

viviendas %>% 
  select(Superficie_Construida_M2,Corredor,Valor_UF) %>% 
  filter(Superficie_Construida_M2 == 100)
