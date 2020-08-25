library("dplyr")
tb<-read.csv(file = "./household_power_consumption.txt",
             ,stringsAsFactors = F,sep = ";")
head(tb)
str(tb)
tb<-tbl_df(tb)

fn1<-mutate(tb,date2 = as.Date.character(x=tb$Date,format = "%d/%m/%Y") )
fn2<-filter(fn1,date2 >= as.Date("2007-02-01") & date2 <= as.Date("2007-02-03"))


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

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
