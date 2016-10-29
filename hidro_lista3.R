#<Code>
#Metodo de Penman
setwd("/home/paulo/Documentos/Hidrometeorologia/lista3")

 t <- read.csv("temperatura_penman.csv", header=T, sep=";")
 vento <- read.csv("vento.csv", header=T, sep=";")
 ur <- read.csv("ur.csv", header=T, sep=";")
 radiacao <- read.csv("radiacao.csv", header=T, sep=";")
 p <- read.csv("tempo_radiacao.csv", header=T, sep=";") #tempo de radiacao
 evapo_ar_livre <- read.csv("evapo_ar_livre.csv", header=T, sep=";")
 evapo_abrigo <- read.csv("evapo_abrigo.csv", header=T, sep=";")
 evapo_ar_livre <- t(evapo_ar_livre)
 evapo_abrigo <- t(evapo_abrigo)
 prec <- read.csv("preciptacao.csv", header=T, sep=";")
 
 
##Costantes e vetores
L <- 59
alpha <- 0.3
sigma <- 1.19*(10**-9)
fc <- c(1.17, 1.01, 1.05, 0.97, 0.94, 0.88, 0.93, 0.98, 1.00, 1.10, 1.11, 1.18)
#p <- c(0.31, 0.29, 0.28, 0.26, 0.25, 0.24, 0.24, 0.26, 0.27, 0.29, 0.30, 0.31)
meses <- month.abb
I <- NULL


##A equacao de Penman: E0 = [(delta/gama)*(qef/L) +Ei]/[(delta/gama) + 1]
#No final tem que transpor a matriz de E0
##Variaveis

#pressao_de_vapor_de_saturacao

e_s <- 4.58*(10**((7.5*t)/(237.3+t)))
e_a <- ur*e_s/100              
vento_2 <- vento*(log10(200/2))/log10(100*10)
Ei <- 0.35*(1/2 + vento_2/160)*(e_s - e_a)
qef_L <- abs(radiacao*(1-alpha) - (sigma*t**4)*(0.56 - 0.09*sqrt(e_a))*(0.1+0.9*p))/L 
delta_gama <- (38640*10**((7.5*t)/(237.3*t)))/((237.3+t)**2)

##Equacao de Penman

E0 <- ((delta_gama)*(qef_L) + Ei)/(delta_gama + 1)
E0[is.na(E0)] <- 0
E0 <- t(E0)

##Equacao de thorntwait

for (i in 1:9) {
  
I[i] <- sum((t[i,]/5)**1.514)
           
               }

a <- 67.5*(10**-8)*(I**3) - 7.71*(10**-6)*(I**2) + 0.01791*I + 0.492 

etp_1 <- fc*16*((10*(t/I))**a)
etp_1 <- t(etp_1)

##Equacao de Blaney-Criddle

etp_2 <- (0.457*t + 8.13)*p
etp_2 <- t(etp_2)

##Razao entre ETP/Prec

##Thornthwait e Blaney-Criddle

razao_1 <- etp_1/t(prec)
razao_2 <- etp_2/t(prec)

##Caso exista alguma indeterminacao ele substitui por zero
razao_1[is.na(razao_1)] <- 0
razao_2[is.na(razao_2)] <- 0

###Criando gráfico
ano <- 2008
#Gráfico da série.
#Cria Binários que serão convertidos posteriormente em .PNG
#Os comandos para salvar estão em comentario, pois gastam muita memoria e são usados somente quando encessário
for (i in 1:9){
 
   plot(E0[,i], type="l", col="red", main=paste("ETP Penman - ETP Abrigo", ano),  xlab = "meses", ylab = "Evapotranspiracao")
   par(new=T)
   plot(evapo_abrigo[,i], axes=F, ann=F, type="l", col="blue")
   legend("topright", legend=c("Penman", "Abrigo"), lty=1, col=c("red", "blue"), bty="n")
   #png(paste("PenmanETPAbrigo_", ano, ".png", sep=""))
   
   ####
   
   plot(E0[,i], type="l", col="red", main=paste("ETP Penman - Ar livre", ano),  xlab = "meses", ylab = "Evapotranspiracao")
   par(new=T)
   plot(evapo_ar_livre[,i], axes=F, ann=F, type="l", col="green")
   legend("topright", legend=c("Penman", "Ar livre"), lty=1, col=c("red", "green"), bty="n")
   #png(paste("PenmanETPArLivre_", ano, ".png", sep=""))
   
   ####
   
   plot(razao_1[,i], type="l", col="orange", main=paste("Precipitação/ETP", ano),  xlab = "meses", ylab = "Evapotranspiracao")
   par(new=T)
   plot(razao_2[,i], axes=F, ann=F, type="l", col="navyblue")
   legend("topright", legend=c("Thorntwait", "Blaney-Criddle"), lty=1, col=c("orange", "navyblue"), bty="n")
   #png(paste("PrecETP_", ano, ".png", sep=""))
   
   ano <- ano + 1  
             
                }

#<endcode>