complete <- function(directory, id = 1:332) {
      answermatrix<-NULL
      for (i in id)  {
            filename<-paste("~/coursera/",directory,"/",sep="")
            if (i<100) {filename<-paste(filename,"0",sep="") }
            if (i<10)  {filename<-paste(filename,"0",sep="") }
            filename<-paste(filename,i,".csv",sep="")
            answermatrix<-rbind(answermatrix,c(i,sum(complete.cases(read.csv(filename)))))
      }
      answer<-data.frame(id=answermatrix[,1],nobs=answermatrix[,2])
      answer
}