# Cargamos las librerías a utilizar
library(tidyverse)
library(datos)

# Actividad 2 Clase 6 ----

# Primero veamos que en nuestra base de datos no se encuentra el año 2011
table(paises$anio)

# Por lo que elegimos cualquier otro año (en este caso el 2007)
paises_2007 = paises %>% 
  filter(anio == 2007)

# Ahora hacemos el gráfico
paises_2007 %>% 
  ggplot(aes(x = pib_per_capita, y = esperanza_de_vida)) + 
  geom_point(aes(color = continente, size = poblacion)) + 
  scale_colour_brewer(palette = "Set1", "Continente") + # Agregamos la paleta deseada
  theme_bw() +
  guides(size = "none") +  # Para quitar la leyenda del tamaño de los puntos 
  scale_x_log10() + 
  labs(title = "Relación entre PIB per Cápita y esperanza de vida", subtitle = "Año: 2007", 
       x = "PIB per cápita anual en dólares (escala logarítmica)", caption = "Fuente: Gapminder", 
       y = "Esperanza de vida al nacer (años)")

# Al no ser el mismo año vemos que el gráfico no es 100% igual, pero es muy parecido #