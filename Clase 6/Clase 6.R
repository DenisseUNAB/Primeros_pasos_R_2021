# Profesor Diego Mu??oz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 6
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentaci??n: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_6.html

# getwd() 
# setwd('Clase 6')

library(ggplot2)
library(dplyr)
library(datos)


paises %>% 
  ggplot(aes(x = esperanza_de_vida)) +
  geom_histogram() +
  # ggtitle("Mi primer gr??fico")+
  # xlab("Esperanza de vida") +
  # ylab("") +
  labs(title = "Mi primer gr??fico",
       x = "Esperanza de vida",
       y = "") +
  theme_light() +
  coord_polar()
  

# opci??n 1
ggplot(data = paises[paises$pais == "Chile",] , 
       aes(x = anio, y = esperanza_de_vida)) + 
  geom_line( color = "#E61400", size = 2)

# opci??n 2

paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) +
  geom_line(color = "#E61400", size = 2, alpha = .2)


# Customizaci??n de los gr??ficos ----

paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) +
  geom_line(color = "#E61400", size = 2, alpha = .2) +
  # labs(title = "Mi segundo gr??fico",
  #      x = "A??o",
  #      y = "Esperanza de vida")
  ggtitle("Mi segundo gr??fico")








