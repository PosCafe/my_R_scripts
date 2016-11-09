##################################################
#Codigo feito por Paulo Pimenta                  #                   
#Contato: paulo.pimenta@usp.br                   #
#Lista de Micrometeorologia                      #
#NUSP:7599770                                    #
##################################################
#<Code>

##Vetores
z <- c(1.0, 5.0, 10.0, 15.0, 20.0)

#Caso 1 e 2 do vento horzintal
u_1 <- c(1.7, 2.9, 3.5, 3.8, 4.0)
u_2 <- c(5.8, 7.8, 8.6, 9.1, 9.5)

const_von_karman <- 0.4
densidade0 <- 1.24

####################################################################
t <- data.frame(z,u_1,u_2)
ajus_1 <- lm(log(z)~t$u_1, data=t)
ajus_2 <- lm(log(z)~t$u_2, data=t)

###ajus_1 e ajus_2 mostram os coeficientes das retas
###Apos saber o comando de cada uma...
###Lembrando que y = b + a*x
###ajus_1: b = -2.179 e a = 1.290
###ajus_2: b = -4.7343 e a = 0.8159
####################################################################
plot(log(t$z)~t$u_1, data=t, main="Ln(z)=Ln(z0)+(k/u*)u(z)", xlab="Vento horizontal [m/s]", ylab="Ln(Altura) [m]")
abline(ajus_1, col="red")
text(2.5,2, "Ln(z)=-2.179+1.290*u_1")

plot(log(t$z)~t$u_2, data=t, main="Ln(z)=Ln(z0)+(k/u*)u(z)", xlab="Vento horizontal [m/s]", ylab="Ln(Altura) [m]")
abline(ajus_2, col="blue")
text(7,2, "Ln(z)=-4.7343+0.8159*u_2")
######################################################################

###Calculando os itens (a) e (b) da lista
u_estrela_1 <- const_von_karman/1.290
u_estrela_2 <- const_von_karman/0.8159

tal_1 <- (u_estrela_1**2)*densidade0
tal_2 <- (u_estrela_2**2)*densidade0

######################################################################
###item (a)
###Tensao de Reynolds para u_1 e u_2 sao, respectivamente:
tal_1; tal_2 

###Os fluxos para u*_1 e u*_2, -ü'ẅ', sao, respectivamente:
-u_estrela_1**2; -u_estrela_2**2

###item (c)
###O parametro de rugosidade e quando u(z)=0
###Quando u(z)=0, entao Ln(z)=Ln(z0) + 0, logo o resultado e Ln(z0), ou o...
###...quando o a reta intercepta o eixo Ln(z).
###Para u_1 e u_2 sao, z0_1 e z0_2, respectivamentes [m]:

exp(1)**-2.179; exp(1)**-4.7343

