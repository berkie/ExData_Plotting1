df<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
df$Date<-as.Date(df$Date,"%d/%m/%Y")

subdf<-df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

x<-paste(subdf$Date, subdf$Time)
datetime<-strptime(x, "%Y-%m-%d %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480)
plot(datetime,subdf$Global_active_power, typ='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

