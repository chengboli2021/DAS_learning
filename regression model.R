data1<-read.table("C:/Users/lcb/Desktop/Msc/R/quiz2/data.txt",sep="",header = TRUE)

x<-cbind(c(1,1,1,1),c(9,4,7,1))
t(x)%*%x
solve(t(x)%*%x)
y<-cbind(c(2,5,3,2))
t(x)%*%y
solve(t(x)%*%x)%*%t(x)%*%y

x4 <- cbind(data1$x1,data1$x2)
t(x4)%*%x4

t(data1$x1)
y=data1$y

y.lm<-lm(data1$y~x4+0)
summary(y.lm)
anova(y.lm)
