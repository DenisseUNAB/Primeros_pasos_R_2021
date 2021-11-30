# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 6
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_6.html

# getwd() 
# setwd('Clase 6')

library(ggplot2)
library(dplyr)
library(datos)
`%notin%` <- Negate(`%in%`)

paises %>% 
  ggplot(aes(x = esperanza_de_vida)) +
  geom_histogram() +
  # ggtitle("Mi primer gráfico")+
  # xlab("Esperanza de vida") +
  # ylab("") +
  labs(title = "Mi primer gr??fico",
       x = "Esperanza de vida",
       y = "") +
  theme_light() +
  coord_polar()
  

# opción 1
ggplot(data = paises[paises$pais == "Chile",] , 
       aes(x = anio, y = esperanza_de_vida)) + 
  geom_line( color = "#E61400", size = 2)

# opción 2

paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) +
  geom_line(color = "#E61400", size = 2, alpha = .2)


# Customización de los gráficos ----

paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) +
  geom_line(color = "#E61400", size = 2, alpha = .2) +
  # labs(title = "Mi segundo gráfico",
  #      x = "Año",
  #      y = "Esperanza de vida")
  ggtitle("Mi segundo gr??fico")


paises %>% 
  filter(pais == "Chile") %>% 
  ggplot(aes(x = anio, y = esperanza_de_vida)) + 
  geom_line() +
  geom_point(size = 6, alpha = .4, col = "#0F55BB") +
  labs(title = "Esperanza de vida en Chile", 
       subtitle = "A??os 1952 a 2007",
       x = "Año",
       y = "Esperanza de vida") 

# plotly::ggplotly()

paises %>% 
  ggplot(aes(x = esperanza_de_vida, y = pib_per_capita)) +
  geom_point(aes(color = continente, size = poblacion),
             alpha = .4)



paises %>% 
  filter(pais %in% c("Chile","Perú","Argentina","Bolivia")) %>% 
  ggplot(aes(x = esperanza_de_vida, y = pib_per_capita)) +
  geom_point(aes(color = poblacion))


paises %>% 
  filter(pais %in% c("Chile","Perú","Argentina","Bolivia")) %>% 
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
#            pais == "Perú"|
#            pais == "Argentina"|
#            pais == "Bolivia")
# 
# 
# paises %>% 
#   filter(pais %in% c("Chile","Perú","Argentina","Bolivia"))

