#######Radar#######
###################

dBZ <- c(30, 40, 45, 50, 55, 60)

diametro <- c(1, 2, 3, 4)

funcao_Z <- function(x){
  
  z <- 10**(x/10)
  
  return(z)
  
                      }

funcao_Gota <- function(x,y){
  
  numero_gotas <- x/(y**6)
  
  return(numero_gotas)
  
                             }

funcao_volume <- function(x){
  
  
volume <- (4/3)*pi*(((x*0.001)/2)**3)
volume_em_litro <- volume*1000

return(volume_em_litro)
  
                            }

###Usando a função Z

a <- funcao_Z(dBZ)

###Numero de gostas separadas porm diametro

####para gostas de 1mm
b_1 <- funcao_Gota(a, diametro[1]) 

####para gostas de 2mm
b_2 <- funcao_Gota(a, diametro[2]) 

####para gostas de 3mm
b_3 <- funcao_Gota(a, diametro[3]) 

####para gostas de 4mm
b_4 <- funcao_Gota(a, diametro[4])

###Volume total por dBZ

####para gostas de 1mm
volume_1 <- funcao_volume(diametro[1])

####para gostas de 2mm
volume_2 <- funcao_volume(diametro[2])

####para gostas de 3mm
volume_3 <- funcao_volume(diametro[3])

####para gostas de 4mm
volume_4 <- funcao_volume(diametro[4])

###################################################################
#valores de Z
a

#numeros de gota de chuva
b_1
b_2
b_3
b_4

#volume unitario de cada diametro de chuva

volume_1
volume_2
volume_3
volume_4

#volume total de chuva

volume_total_1 <- b_1*volume_1
volume_total_2 <- b_2*volume_2
volume_total_3 <- b_3*volume_3
volume_total_4 <- b_4*volume_4

volume_total_1
volume_total_2
volume_total_3
volume_total_4

c <- data.frame(volume_total_1,volume_total_2,volume_total_3,volume_total_4)
names(c) <- c("Vol Total-1mm", "Vol Total-2mm", "Vol Total-3mm", "Vol Total-4mm")
c