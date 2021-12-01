# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 7
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_7.html


library(datos)

# paises %>% 
#   pull(continente)
# 
# paises$continente


paises %>% 
  pull(continente) %>% 
  table() %>% 
  prop.table()*100



datos <- datos::paises %>% 
  dplyr::mutate(BajoMedia = case_when(esperanza_de_vida <= mean(esperanza_de_vida) ~ "Bajo Media", TRUE ~ "Sobre Media"))

table(datos$continente, datos$BajoMedia) %>% 
  prop.table()*100

table(datos$continente, datos$BajoMedia) %>% 
  prop.table(margin = 1)*100

table(datos$continente, datos$BajoMedia) %>% 
  prop.table(margin = 2)*100



flores <- datos::flores %>% tibble()
cor(flores$Largo.Sepalo, flores$Ancho.Petalo, method = "pearson")


flores %>% 
  select_if(is.numeric) %>% 
  cor() %>% 
  ggcorrplot(method = "circle",
             type = "upper")

IMACEC <- readxl::read_excel("Data_IMACEC.xlsx")

IMACEC %>% 
  janitor::clean_names() %>% 
  filter(year >= 2010) %>% 
  group_by(year) %>% 
  summarise(media     = mean(precio_cobre, na.rm = TRUE),
            mediana   = median(precio_cobre, na.rm = TRUE),
            sd        = sd(precio_cobre, na.rm = TRUE),
            Q1        = quantile(precio_cobre, probs = 0.25),
            Q3        = quantile(precio_cobre, probs = 0.75),
            min       = min(precio_cobre, na.rm = TRUE),
            max       = max(precio_cobre, na.rm = TRUE),
            asimetria = moments::skewness(precio_cobre, na.rm = TRUE),
            curtosis  = moments::kurtosis(precio_cobre, na.rm = TRUE))

#install.packages("moments")

# Ejecutar todo el código hacia arriba
# control + alt + b



