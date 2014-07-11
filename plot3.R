plot3<-function(){
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  subdata<-subset(data,(data$Date=="1/2/2007"|data$Date=="2/2/2007"))
  subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot3.png")
  
  with(subdata,{
    plot(DateTime,Sub_metering_1,col="black",type="l",xlab=NA,ylab="Energy sub metering")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
  })
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid")
  
  dev.off()
}