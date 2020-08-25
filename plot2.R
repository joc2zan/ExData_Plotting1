library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";",na.strings="?")
head(tb)
str(tb)
tb<-tbl_df(tb)
summary(tb)
# Filter dataset

dt <- tb[ tb$Date %in% c("1/2/2007","2/2/2007"),]
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

#Plotting

pp<-na.omit(dt)

dtime <- strptime(paste(pp$Date, pp$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
plot(dtime,pp$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

# Print
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
