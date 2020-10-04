dataset <- read_excel("informesexcel.xlsx")
tests <- as.matrix(dataset[c(4,5,9)])
UWES <- as.matrix(dataset[c(6,7,8)])

dir.create('.\\tests')
setwd("./tests")
for (i in 1:nrow(tests)) {
png(file=paste0("testresults",i,".png"),width=759, height=500,units="px")
barplot(tests[i,],horiz = TRUE,xlim=c(0,5),col=c("dodgerblue3","firebrick3","goldenrod3"),main="Resultados tests",names.arg = c("Resiliencia","GHQ_12","UWES_9"),axes=FALSE)
axis(1, at=0:5, labels=c("No aplicado","Muy Bajo","Bajo","Medio","Alto","Muy Alto"))
dev.off()
}

dir.create('.\\UWES')
setwd("./UWES")
for (i in 1:nrow(UWES)) {
  png(file=paste0("UWESresults",i,".png"),width=759, height=500,units="px")
  barplot(tests[i,],horiz = TRUE,xlim=c(0,5),col=c("darkolivegreen1","green3","forestgreen"),main="Resultados tests",names.arg = c("Vigor","Dedicación","Absorción"),axes=FALSE)
  axis(1, at=0:5, labels=c("No aplicado","Muy Bajo","Bajo","Medio","Alto","Muy Alto"))
  dev.off()
}
