plot4<-function(){
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  subdata<-subset(data,(data$Date=="1/2/2007"|data$Date=="2/2/2007"))
  subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot4.png")
  
  par(mfrow=c(2,2))
  par(mar=c(4,4,1,1))
  
  with(subdata,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab=NA))
  
  with(subdata,plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
  
  with(subdata,{
    plot(DateTime,Sub_metering_1,col="black",type="l",xlab=NA,ylab="Energy sub metering")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
  })
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",bty="n",xjust=1)

  with(subdata,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))
  
  dev.off()
}