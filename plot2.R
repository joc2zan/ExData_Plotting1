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

#Plotting

cua<-data.frame(as.numeric(g$Global_active_power),g$date2)
plot(cua$as.numeric.g.Global_active_power.~cua$g.date2, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# Print
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
