library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";")
head(tb)
str(tb)
tb<-tbl_df(tb)

# Filter dataset

fn1<-mutate(tb,date2 = as.Date.character(x=tb$Date,format = "%d/%m/%Y") )
fn2<-filter(fn1,date2 >= as.Date("2007-02-01") & date2 <= as.Date("2007-02-03"))
g<-group_by(fn2,date2)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

### plot1
h1<-hist(as.numeric(fn2$Global_active_power),
         #col = "red",
         #main = "Global Active Power",
         #xlab = "Global Active Power (kilowatts)",
         breaks = 20,
         freq = T,
         plot = F)

plot(h1,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     axes = F
)
axis(1,at = seq(from=0,to=6,by = 2) )
axis(2,at = seq(from=0,to=1200, by = 200) )

##plot 2
#Plotting

cua<-data.frame(as.numeric(g$Global_active_power),g$date2)
plot(cua$as.numeric.g.Global_active_power.~cua$g.date2, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

## plot 3

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


## plot 4

plot(as.numeric(g$Global_active_power)~g$date2, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

