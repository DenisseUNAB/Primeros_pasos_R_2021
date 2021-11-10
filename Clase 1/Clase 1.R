# Profesor Diego Muñoz - dimunoz1@uc.cl
# Ayudante Felipe Moya - felipe.moya@uc.cl

# Clase 1
# Repositorio GitHub: https://github.com/DiegoHoliwis/Primeros_pasos_R_2021
# Presentación: https://diegoholiwis.github.io/Primeros_pasos_R_2021/Clase_1.html


library(tidyverse)
library(RSelenium)
library(rvest)
library(ggplot2)


print('Hola R') # Prin es una función que sirve para mostrar un mensaje
paste("Primeros","pasos en","R","geronigiouwerghbiu", sep = " ")

paste(paste("Primeros","pasos en", sep = " "),"R",sep = "-")


a <- 5

# Mi primera sección -------------------------

poleras <- c(254,203,182,50)
meses <- c("Ene", "Feb", "Mar", "Abr")
min(poleras)
plot(poleras)
barplot(poleras, names.arg = meses, col="orange")
boxplot(poleras)
hist(poleras)

# 
write.csv(cbind(meses, poleras),"poleras.csv")
read.csv("datos/poleras.csv")

getwd() # en que carpeta estan posicionados
setwd("Clase 1")

# a.-
2+4*5 - exp(3)

# b.-
log(5) + pi/sqrt(5)


