pollutantmean <- function(directory, pollutant, id = 1:332) {
      alldata<-NULL
      for (i in id)  {
            filename<-paste("~/coursera/",directory,"/",sep="")
            if (i<100) {filename<-paste(filename,"0",sep="") }
            if (i<10)  {filename<-paste(filename,"0",sep="") }
            filename<-paste(filename,i,".csv",sep="") 
            alldata<-rbind(alldata,read.csv(filename))   } 
      if(pollutant=="sulfate") {p<-2}
      if(pollutant=="nitrate") {p<-3}
      mean(alldata[,p],na.rm=TRUE)
}