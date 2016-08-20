################################################
###Script feito por Paulo Pimenta: paulopimenta6@gmail.com ou paulo.pimenta@usp.br

tal_aerossol <- c(0.0, 0.5, 1.0, 2.0)

###############################################
##########canal do azul########################

#######################Tudo aqui é L_lambda############################

####azul#######

troposferico_azul <- c(72.42, 80.67, 97.09, 132.26) 

oceanico_azul <- c(72.42, 74.30, 84.52, 114.33)

####vermelho#######

troposferico_vermelho <- c(35.16, 36.89, 44.16, 65.44)

oceanico_vermelho <- c(35.16, 33.31, 39.41, 62.04)

####iv_proximo#######

troposferico_iv_proximo <- c(143.55, 137.93, 131.79, 121.02) 

oceanico_iv_proximo <- c(143.55, 138.76, 135.87, 133.41)

######irradiancia_espectral_solar_incidente_no_TOA#######

##########################################################################

F0lambda <- c(1541.60, 1371.90, 848.21)

function_refletancia(a, b){
 

