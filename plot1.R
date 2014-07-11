plot1<-function(){
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  subdata<-subset(data,(data$Date=="1/2/2007"|data$Date=="2/2/2007"))
  subdata$DateTime<-strptime(paste(subdata$Date,subdata$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot1.png")
  
  hist(subdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  
  dev.off()
}