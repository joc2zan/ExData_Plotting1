library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";",na.strings = "?")
head(tb)
str(tb)
tb<-tbl_df(tb)


dt <- tb[ tb$Date %in% c("1/2/2007","2/2/2007"),]
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

pp<-na.omit(dt)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

### plot1

dtime <- strptime(paste(pp$Date, pp$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

plot(dtime,pp$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

### plot 2

plot(dtime,as.numeric(pp$Voltage),
     type="l",
     ylab="Voltage",xlab="")

## plot 3

plot(dtime,pp$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col="black")

lines(dtime,pp$Sub_metering_2,col="red")

lines(dtime,pp$Sub_metering_3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=names(pp[7:9]),)

## plot 4

plot(dtime,as.numeric(pp$Global_reactive_power),
     type="l", 
     ylab="Global Rective Power (kilowatts)",
     xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

