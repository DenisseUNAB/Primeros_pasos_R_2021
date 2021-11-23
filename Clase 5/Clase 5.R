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

# seleccionar variables
paises %>% 
  select(continente, anio, esperanza_de_vida)

# filtrar, y calcular medidas de resumenes por grupo
paises %>% 
  filter(anio == 2007) %>% 
  group_by(continente) %>% 
  summarise(Promedio_esperanza_vida = mean(esperanza_de_vida),
            Promedio_Población      = mean(poblacion),
            Observaciones           = n())

# contar el número de filas por grupo
paises %>% 
  filter(anio == 2007) %>% 
  group_by(continente) %>% 
  count()

# Seleccionar filas
paises %>% 
  slice(1,3,5,10)

# Ordenar una base de datos
# Ordenamiento por la variable año
paises %>% 
  arrange(anio)

# Ordenar por año, pero de forma descendiente
paises %>% 
  arrange(desc(anio))

# Ordenar por año y esperanza de vida
paises %>% 
  arrange(desc(anio), desc(esperanza_de_vida))

# Modificar una variable
paises %>% 
  mutate(pais = str_to_lower(pais))

# Crear una nueva variable y cambiarle el nombre
Tabla1 <- paises %>% 
  mutate(pais2 = str_to_lower(pais)) %>% 
  rename(`País en miniscula` = pais2)

# Exportar una base de datos
Tabla1 %>% 
  openxlsx::write.xlsx("Tabla1.xlsx")

# Esperanza de vida: 
# Baja si es menor a 65 años
# Estándar si esta entre los 65 y 75
# Alta si es mayor a los 75

paises %>% 
  mutate(Esperanza_vida_agrupada = case_when(esperanza_de_vida < 65 ~ "Baja",
                                             esperanza_de_vida < 75 ~ "Estandar",
                                             esperanza_de_vida >= 75 ~ "Alta",
                                             TRUE ~ "Edad no admisible")) %>% 
  View()









