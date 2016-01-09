df<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
df$Date<-as.Date(df$Date,"%d/%m/%Y")

subdf<-df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

png(filename = "plot1.png", width = 480, height = 480)
hist(subdf$Global_active_power,col = "red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
