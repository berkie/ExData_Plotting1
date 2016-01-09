df<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
df$Date<-as.Date(df$Date,"%d/%m/%Y")

subdf<-df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

x<-paste(subdf$Date, subdf$Time)
datetime<-strptime(x, "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# First plot:
plot(datetime,subdf$Global_active_power, typ='l',xlab="",ylab="Global Active Power")
# Second plot:
plot(datetime,subdf$Voltage, typ='l',ylab="Voltage")
#Third plot:
plot(datetime,subdf$Sub_metering_1,typ="l",col = "black",xlab="",ylab="Energy sub metering")
lines(datetime,subdf$Sub_metering_2,col="red")
lines(datetime,subdf$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
#Fourth plot
plot(datetime,subdf$Global_reactive_power, typ='l',ylab="Global_reactive_power")
dev.off()