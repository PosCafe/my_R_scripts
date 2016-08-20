#################################################################################
##Codigo Feito por Paulo Pimenta: paulo.pimenta@usp.br e paulopimenta6@gmail.com
##Contribuicao de Rafael Jonas: rafael.jonas@gmail.com #########################
##Contribuicao do forum R-br: http://r-br.2285057.n4.nabble.com/ ###############
################################################################################

#E possivel configurar o local onde o codigo sera rodado, neste caso usei como exemplo meu pendrive 
setwd("/media/paulo/paulo_ext_3/dados_inmet/block_3")

### <begin>
library(bitops)
library(RCurl)

exemplo <- NULL

###################################################################

dados_1 <- read.table("estacoes_2.txt", header=F, sep="\t")
dados_1 <- data.frame(dados_1)
names(dados_1) <- c("cidades", "estacoes")


dt.inicio <- "01/01/1961" #Para especificar o range de datas
dt.fim <- "01/06/2016"

#######################################################################

###Aqui começa a leitura de cada estacao e a alocacao em forma de vetor  
cod_OMM <- dados_1[,2]

#######################################################################

###Links para login e dados

myURL1 <- "http://www.inmet.gov.br/projetos/rede/pesquisa/inicio.php"
myURL2 <- paste0("http://www.inmet.gov.br/projetos/rede/pesquisa/gera_serie_txt.php?&mRelEstacao=", cod_OMM, "&btnProcesso=serie&mRelDtInicio=", dt.inicio, "&mRelDtFim=", dt.fim, "&mAtributos=1,,,,1,1,,1,1,,,1,,,,,")

###Dados para acesso
myParams=list(
  mCod="LOGIN", 
  mSenha="SENHA",
  btnProcesso = " Acessar ")

myCurl <- getCurlHandle()
curlSetOpt(cookiejar="cookies.txt", useragent="Mozilla/5.0", followlocation=TRUE, curl=myCurl)

###Aqui e feito a captura dos dados e a transformacao dele num .txt
for (i in 1:length(cod_OMM)){
  
  login <- postForm(myURL1, .params=myParams, curl=myCurl)
  
  dados_1[i] <- getURLContent(myURL2[i], curl=myCurl)
  
  file <- as.character(paste("inmet_", cod_OMM[i], ".txt", sep="")) 
  write.table(dados_1[i], file)
                                                
  
}

### <end>
