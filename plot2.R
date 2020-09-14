download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip",method="curl")
unzip("power.zip")

db<-read.table("household_power_consumption.txt",header = FALSE,sep = ";",na.strings = "?",skip = 66637,nrows = 2880)
names(db) <- read.table("household_power_consumption.txt",sep=";",nrows = 1)
library(dplyr)
library(lubridate)
dbTime <- mutate(db,datetime=dmy_hms(paste(Date,Time)))

png(filename = "plot2.png", width = 480, height = 480)
with(dbTime, plot(datetime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.off()
