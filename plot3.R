library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";")
head(tb)
str(tb)
tb<-tbl_df(tb)

# Filter dataset

fn1<-mutate(tb,date2 = as.Date.character(x=tb$Date,format = "%d/%m/%Y") )
fn2<-filter(fn1,date2 >= as.Date("2007-02-01") & date2 <= as.Date("2007-02-03"))
gg<-group_by(fn2,date2)

str(as.double(g$Sub_metering_1))
View(is.na(as.double(g$Sub_metering_1)))

g<-gg[complete.cases(gg),]
quin<-data.frame(as.double(g$Sub_metering_1),
                 as.double(g$Sub_metering_2),
                 as.double(g$Sub_metering_3),
                 as.double(g$Global_active_power),
                 fn2$date2)


plot(quin$as.double.g.Global_active_power.~quin$fn2.date2, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

lines(quin$as.double.g.Sub_metering_1.~quin$fn2.date2,
      col='black')
lines(quin$as.double.g.Sub_metering_2.~quin$fn2.date2,
      col='red')
lines(quin$as.double.g.Sub_metering_3.~quin$fn2.date2,
      col='blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
