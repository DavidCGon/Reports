##Cargo los dataset

library(readxl)
dataset <- read_excel("resexcel.xlsx")
dataset <- dataset[1:9]
informesexcel <- dataset

##Saco los datos para hacer el gráfico

tests <- as.matrix(dataset[c(4,5,9)])
UWES <- as.matrix(dataset[c(6,7,8)])

## Creo la carpeta para guardar cada gráfico de los resultados de los 3 tests.
dir.create('.\\tests')
setwd("./tests")
for (i in 1:nrow(tests)) {
png(file=paste0("testresults",i,".png"),width=759, height=500,units="px")
barplot(tests[i,],horiz = TRUE,xlim=c(0,5),col=c("dodgerblue3","firebrick3","goldenrod3"),main="Resultados tests",names.arg = c("Resiliencia","GHQ_12","UWES_9"),axes=FALSE)
axis(1, at=0:5, labels=c("No aplicado","Muy Bajo","Bajo","Medio","Alto","Muy Alto"))
dev.off()
}

## Creo la carpeta para guardar cada gráfico de los resultados del test UWES.
dir.create('.\\UWES')
setwd("./UWES")
for (i in 1:nrow(UWES)) {
  png(file=paste0(
    "UWESresults",i,".png"),width=759, height=500,units="px")
  barplot(tests[i,],horiz = TRUE,xlim=c(0,5),col=c("darkolivegreen1","green3","forestgreen"),main="Resultados tests",names.arg = c("Vigor","Dedicación","Absorción"),axes=FALSE)
  axis(1, at=0:5, labels=c("No aplicado","Muy Bajo","Bajo","Medio","Alto","Muy Alto"))
  dev.off()
}

## Creo las columnas para guardar el texto de los resultados de los informes

results <- read_excel("textoreport.xlsx",sheet = "RESULTADOS")
colnames(results) <- c("Niv","GHQ","UWES","RESIL")
restest <- matrix(ncol=3,nrow=nrow(informesexcel))
colnames(restest)=c("resultsGHQ","resultsUWES","resultsResi")
informesexcel <- cbind(informesexcel,restest)

## Bucle que pega el código del resultado del GHQ

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$GHQ_12_INFORME[i]==0){
    informesexcel$resultsGHQ[i]=c("No se ha cumplimentado esta prueba, por lo tanto no podemos ofrecerle resultado")
  } else {
    if(informesexcel$GHQ_12_INFORME[i]==1){
      informesexcel$resultsGHQ[i]=results$GHQ[1]
    } else {
      if(informesexcel$GHQ_12_INFORME[i]==2){
        informesexcel$resultsGHQ[i]=results$GHQ[2]
      } else {
        if(informesexcel$GHQ_12_INFORME[i]==3){
          informesexcel$resultsGHQ[i]=results$GHQ[3]
        } else {
          informesexcel$resultsGHQ[i]=results$GHQ[4]
        }}}}
}

## Bucle que pega el código del resultado del UWES

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$TOTAL_UWES_9_INFORME[i]==0){
    informesexcel$resultsUWES[i]=c("No se ha cumplimentado esta prueba, por lo tanto no podemos ofrecerle resultado")
  } else {
    if(informesexcel$TOTAL_UWES_9_INFORME[i]==1){
      informesexcel$resultsUWES[i]=results$UWES[1]
    } else {
      if(informesexcel$TOTAL_UWES_9_INFORME[i]==2){
        informesexcel$resultsUWES[i]=results$UWES[2]
      } else {
        if(informesexcel$TOTAL_UWES_9_INFORME[i]==3){
          informesexcel$resultsUWES[i]=results$UWES[3]
        } else {
          informesexcel$resultsUWES[i]=results$UWES[4]
        }}}}
}

## Bucle que pega el código del resultado del test de Resiliencia

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$RESILIENCIA_INFORME[i]==0){
    informesexcel$resultsResi[i]=c("No se ha cumplimentado esta prueba, por lo tanto no podemos ofrecerle resultado")
  } else {
    if(informesexcel$RESILIENCIA_INFORME[i]==1){
      informesexcel$resultsResi[i]=results$RESIL[1]
    } else {
      if(informesexcel$RESILIENCIA_INFORME[i]==2){
        informesexcel$resultsResi[i]=results$RESIL[2]
      } else {
        if(informesexcel$RESILIENCIA_INFORME[i]==3){
          informesexcel$resultsResi[i]=results$RESIL[3]
        } else {
          informesexcel$resultsResi[i]=results$RESIL[4]
        }}}}
}

rm(restest,results)

## Creo las columnas que guardan las recomendaciones

recomendac <- read_excel("textoreport.xlsx", sheet = "RECOMENDACIONES")
recomen <- matrix(ncol=3,nrow=nrow(informesexcel))
colnames(recomen)=c("recGHQ","recUWES","recResi")
colnames(recomendac)=c("Niv", "recGHQ","recUWES","recResi")
informesexcel <- cbind(informesexcel,recomen)

## Bucle para las recomendaciones del GHQ

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$GHQ_12_INFORME[i]==0){
    informesexcel$recGHQ[i]=c("Al no haberse cumplimentado esta prueba, no se han obtenido resultados. No se pueden aplicar recomendaciones.")
  } else {
    if(informesexcel$GHQ_12_INFORME[i]==1){
      informesexcel$recGHQ[i]=recomendac$recGHQ[1]
    } else {
      if(informesexcel$GHQ_12_INFORME[i]==2){
        informesexcel$recGHQ[i]=recomendac$recGHQ[2]
      } else {
        if(informesexcel$GHQ_12_INFORME[i]==3){
          informesexcel$recGHQ[i]=recomendac$recGHQ[3]
        } else {
          informesexcel$recGHQ[i]=c("Los resultados obtenidos por el sujeto en esta prueba son elevados. No se realizan recomendaciones.")
        }}}}
}

## Bucle para las recomendaciones del UWES

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$TOTAL_UWES_9_INFORME[i]==0){
    informesexcel$recUWES[i]=c("Al no haberse cumplimentado esta prueba, no se han obtenido resultados. No se pueden aplicar recomendaciones.")
  } else {
    if(informesexcel$TOTAL_UWES_9_INFORME[i]==1){
      informesexcel$recUWES[i]=recomendac$recUWES[1]
    } else {
      if(informesexcel$TOTAL_UWES_9_INFORME[i]==2){
        informesexcel$recUWES[i]=recomendac$recUWES[2]
      } else {
        if(informesexcel$TOTAL_UWES_9_INFORME[i]==3){
          informesexcel$recUWES[i]=recomendac$recUWES[3]
        } else {
          informesexcel$recUWES[i]=c("Los resultados obtenidos por el sujeto en esta prueba son elevados. No se realizan recomendaciones.")
        }}}}
}

## Bucle para las recomendaciones del test de Resiliencia 

for (i in 1:nrow(informesexcel)) {
  if(informesexcel$RESILIENCIA_INFORME[i]==0){
    informesexcel$recResi[i]=c("Al no haberse cumplimentado esta prueba, no se han obtenido resultados. No se pueden aplicar recomendaciones.")
  } else {
    if(informesexcel$RESILIENCIA_INFORME[i]==1){
      informesexcel$recResi[i]=recomendac$recResi[1]
    } else {
      if(informesexcel$RESILIENCIA_INFORME[i]==2){
        informesexcel$recResi[i]=recomendac$recResi[2]
      } else {
        if(informesexcel$RESILIENCIA_INFORME[i]==3){
          informesexcel$recResi[i]=recomendac$recResi[3]
        } else {
          informesexcel$recResi[i]=c("Los resultados obtenidos por el sujeto en esta prueba son elevados. No se realizan recomendaciones.")
        }}}}
}

rm(recomen,recomendac)

## Añadir la columna de la ruta

path <- matrix(ncol=1,nrow=nrow(informesexcel))
colnames(path) <- c("Ruta")
informesexcel <- cbind(informesexcel,path)

## Bucle para el path del fichero

for (i in 1:nrow(informesexcel)) {
  informesexcel$Ruta[i]=paste0("./tests/testresults",i,".png")
}
rm(path,i)

library(openxlsx)
write.xlsx(informesexcel,"resexcel.xlsx",col.names=T)