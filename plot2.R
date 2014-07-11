plot2<-function(){
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  subdata<-subset(data,(data$Date=="1/2/2007"|data$Date=="2/2/2007"))
  subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot2.png")
  
  plot(subdata$DateTime,subdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
  
  dev.off()
}