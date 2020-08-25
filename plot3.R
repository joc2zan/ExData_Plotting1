library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";",na.strings = "?")
head(tb)
str(tb)
tb<-tbl_df(tb)

# Filter dataset

dt <- tb[ tb$Date %in% c("1/2/2007","2/2/2007"),]
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

#Plotting

pp<-na.omit(dt)

dtime <- strptime(paste(pp$Date, pp$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

plot(dtime,pp$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col="black")

lines(dtime,pp$Sub_metering_2,col="red")

lines(dtime,pp$Sub_metering_3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=names(pp[7:9]),)


dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
