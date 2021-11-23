# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 5
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_5.html

library(tidyverse)
library(datos)

# Sintaxis en tidyverse ----


paises %>% 
  filter(anio == 2007) %>% 
  summarize(mean(poblacion))


summarize(filter(paises, anio == 2007), mean(poblacion))

# Dplyr =======================

paises %>% 
  select(continente, anio, esperanza_de_vida)



paises %>% 
  filter(anio == 2007) %>% 
  group_by(continente) %>% 
  summarise(Promedio_esperanza_vida = mean(esperanza_de_vida),
            Promedio_Población      = mean(poblacion),
            Observaciones           = n())


paises %>% 
  filter(anio == 2007) %>% 
  group_by(continente) %>% 
  count()


paises %>% 
  



paises %>% 
  mutate(pais = str_to_lower(pais))

Tabla1 <- paises %>% 
  mutate(pais2 = str_to_lower(pais)) %>% 
  rename(`País en miniscula` = pais2)


Tabla1 %>% 
  openxlsx::write.xlsx("Tabla1.xlsx")





