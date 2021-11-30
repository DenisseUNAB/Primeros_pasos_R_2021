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

paises %>% 
  filter(pais %in% c("Chile","Perú","Argentina","Bolivia")) %>% 
  ggplot(aes(x = anio,y = esperanza_de_vida,
             color = pais) ) +
  geom_point(size = 3) + geom_line(size = 1) +
  facet_grid(pais ~ continente)


# Colores ----

ggplot(data=mtautos, aes(x=peso, y=millas, col=factor(cilindros) )) +
  geom_point(size = 5) +
  scale_color_manual(values=c("#00E9FC","#fdd5c5","#c5ffc5"),"Cilindros")


# Paletas de colores

install.packages("RColorBrewer")
library(RColorBrewer)

ggplot(data=paises, 
       aes(x = esperanza_de_vida, 
           y = pib_per_capita, color = continente))+
  geom_point(size = 2) + 
  scale_color_brewer(palette="Dark2")

# Paneles gráficos ----

ggplot(data=paises, 
       aes(x = esperanza_de_vida, 
           y = pib_per_capita, color = continente))+
  geom_point(size = 2, alpha = 0.7) +
  facet_grid(~continente)

paises %>% 
  filter(pais %in% c("Chile","Perú","Argentina","Bolivia")) %>% 
  ggplot(aes(x = anio,y = esperanza_de_vida,
             color = pais) ) +
  geom_point(size = 3) + geom_line(size = 1) +
  facet_wrap( ~ pais + continente)


install.packages("gridExtra")
library(gridExtra)

g1 <- ggplot(data = paises, aes(x = esperanza_de_vida)) + 
  geom_histogram(fill = "lightblue") +
  labs(x = element_blank(), y = element_blank(), title = "Grafico 1")
g2 <- ggplot(data = paises, aes(x = esperanza_de_vida)) + 
  geom_boxplot(fill = "lightblue") + 
  labs(x=element_blank(), title = "Grafico 2") 


gridExtra::grid.arrange(g1,g2, nrow=2, top = "Dashbord xxxxx")


# Matriz de correlación ----

library(ggcorrplot)
cor_autos = cor(mtautos)
ggcorrplot(cor_autos)


mtautos %>% 
  ggplot(aes(x = millas)) +
  geom_density()

mtautos %>% 
  ggplot(aes(x = caballos)) +
  geom_density()

# Taller 1 ----

df <- readxl::read_excel("viviendasRM.xlsx")

## Pregunta 1 ----
df %>% 
  ggplot(aes(x = Valor_UF)) +
  geom_histogram(color = "darkcyan", fill = "blue")

## Pregunta 2 -----

df$`N Habitaciones` %>% str()


df %>% 
  filter(`N Habitaciones` >= 15)

df %>% 
  ggplot(aes(y = Valor_UF, fill = factor(`N Habitaciones`))) +
  geom_boxplot()

# Pregunta 3 ----
df$`Superficie Construida M2` %>% str()

df %>% 
  mutate(`Superficie Construida M2` = as.numeric(`Superficie Construida M2`)) %>% 
  select(Valor_UF,`Superficie Construida M2`) %>% 
  na.omit() %>% 
  filter(`Superficie Construida M2` < 200000) %>% 
  ggplot(aes(x = Valor_UF, y = `Superficie Construida M2`)) +
  geom_point()
  # scale_y_log10()
  

# Pregunta 4 ----

df %>% glimpse()

df %>% 
  select_if(is.numeric) %>% 
  na.omit() %>% 
  cor() %>% 
  ggcorrplot()
  # corrplot::corrplot()

# Pregunta 5 ----

df %>% 
  select_if(is.numeric) %>% 
  na.omit() %>% 
  GGally::ggpairs()

