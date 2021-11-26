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
`%notin%` <- Negate(`%in%`)

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


paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) + 
  geom_line() +
  geom_point(size = 6, alpha = .4, col = "#0F55BB") +
  labs(title = "Esperanza de vida en Chile", 
       subtitle = "A??os 1952 a 2007",
       x = "A??o",
       y = "Esperanza de vida") 

# plotly::ggplotly()

paises %>% 
  ggplot(aes(x = esperanza_de_vida, y = pib_per_capita)) +
  geom_point(aes(color = continente, size = poblacion),
             alpha = .4)



paises %>% 
  filter(pais %in% c("Chile","Per??","Argentina","Bolivia")) %>% 
  ggplot(aes(x = esperanza_de_vida, y = pib_per_capita)) +
  geom_point(aes(color = poblacion))


paises %>% 
  filter(pais %in% c("Chile","Per??","Argentina","Bolivia")) %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida, color = pais) ) +
  geom_point(size = 3) +
  geom_line(size = 1) +
  theme_bw() + 
  theme(legend.position   = "top",
        legend.title      = element_text(colour = "red", size = 30),
        legend.background = element_rect(fill="#0F55BB"),
        axis.text = element_text(size = 15)) 


# paises %>% 
#   filter(pais == "Chile" |
#            pais == "Per??"|
#            pais == "Argentina"|
#            pais == "Bolivia")
# 
# 
# paises %>% 
#   filter(pais %in% c("Chile","Per??","Argentina","Bolivia"))

