corr <- function(directory, threshold = 0) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      corvector<-NULL
      fulldirectory<-paste("~/coursera/",directory,sep="")
      file_list<- list.files(fulldirectory)
      for (i in file_list) {
            newdata<-read.csv(paste(fulldirectory,"/",i,sep=""))   #read in a data file
            new_complete<-newdata[complete.cases(newdata),]    #throw out rows with NA
            if (threshold==0) {threshold<-1}
            if (nrow(new_complete)>=threshold)  {              #see if there's enough data
                  newcor<-cor(new_complete[,2],new_complete[,3])         #if so, calculate the correlation
                  corvector<-c(corvector,newcor) }
      }
      if (length(corvector)==0) {numeric(length=0)}
      else {corvector}
}