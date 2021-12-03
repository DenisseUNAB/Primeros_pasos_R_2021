# Cargamos las librerías a utilizar
library(tidyverse)
library(datos)

# Actividad 1 Clase 7 ----

### 1.) ----

# Cargamos la base bancos
bancos = rio::import("Clase 7/base_bancos.xlsx") %>% as_tibble() %>% janitor::clean_names()
# De manera equivalente podemos usar 
bancos = readxl::read_excel("Clase 7/base_bancos.xlsx") %>% janitor::clean_names()

# Realizamos el análisis exploratorio de las variables
glimpse(bancos)

### 2.) ----

# Veamos la cantidad de clientes profesionales para cada comuna
bancos %>% 
  filter(profesion == "SI") %>% 
  group_by(comuna) %>% 
  summarise(cantidad = n())

### 3.) ----

# Primero veamos la distribución de las edades
quantile(bancos$edad)

# Ahora creamos una variable con los rangos etarios
bancos = 
  bancos %>% 
  mutate(rango_et = case_when(edad >= 18 & edad < 30 ~ "Joven",
                              edad >= 30 & edad < 42 ~ "Adulto",
                              edad >= 42 & edad < 55.75 ~ "Adulto-M",
                              edad >= 55.75 & edad < 67 ~ "Mayor",
                              edad >= 67 ~ "Mayor-M"))

# Ahora veamos quienes solicitan crédito
table(bancos$rango_et, bancos$credito) # Donde 1 indica que si solicitan crédito y 0 que no lo solicitan

### 4.) ----

# Calculemos la cantidad de hijos que tiene la gente que solicitó crédito
clientes_cred = 
  bancos %>% 
  filter(credito == 1) 
  
table(clientes_cred$hijos)

### 5.) ----

# Calculamos el ingreso promedio mensual por comuna
bancos %>% 
  group_by(comuna) %>% 
  summarise(ingreso_prom = mean(ingreso_mensual))

### 6.) ----

# Calculamos esta edad promedio
clientes_cred %>% 
  group_by(sexo) %>% 
  summarise(edad_prom = mean(edad))
  
# Actividad 2 Clase 7 ----

# Primero definimos los datos
Mailings = c(96, 40, 104, 128, 164, 76, 72, 80, 84, 180, 44, 36)
Conversiones = c(41, 41, 51, 53, 60, 61, 50, 28, 48, 70, 33, 30)

# Veamos la correlación entre estas dos variables 
cor(Mailings, Conversiones, method = "pearson") 
## Notamos que tiene correlación 0.7661246, es decir que a priori podemos decir que a mayor cantidad de correos de la campaña 
## electoral hay una mayor tasa de conversiones. Aunque esta correlación no es tan cercana a 1.





  

