movies<-read.csv("C:/Users/lcb/Desktop/学习/R/quiz1/真题/真题/CT1MSC/julymovies.csv",na.string="*")
lionsgate<-sum(movies$distributor=="Lionsgate")
missing<-colSums(is.na(movies))
movies<-subset(movies,!is.na(movies$top)&!is.na(movies$days))

disney <- subset(movies, movies$distributor=="Walt Disney")
average.gross <- sum(as.numeric(disney$gross))/sum(disney$theaters)

log.gross <- log(movies$gross)
movies <- transform(movies, log.gross=log.gross)
movies<-movies[order(movies$theaters),]
theaters <- c(seq(1,1000,length.out=300), seq(1001,6000,length.out=315))
set.seed(123); log.gross <- log(theaters)+rnorm(615)

plot(movies$log.gross~ movies$theaters,
     cex.axis=1.1, cex.lab=1.1, cex.main=1.1,
     main="log(Gross Revenue) vs Number of Theaters",
     col=c("blue", "red")[unclass(movies$top)+1],
     cex = unclass(movies$top)+1,
     pch=19)
legend("bottomright", pch=19, legend=c("in top 100", "outside top 100"), col=c(2,4),cex=1.1)


#assessment 1 模拟 
starwars<-read.csv("C:/Users/lcb/Desktop/assessment1 模拟/starwars.csv",na.strings = "NA")
missing<-colSums(is.na(starwars))

missing<-colSums(is.na(starwars)) /nrow(starwars)
missing

