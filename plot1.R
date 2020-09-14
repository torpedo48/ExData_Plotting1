download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power.zip",method="curl")
unzip("power.zip")

db<-read.table("household_power_consumption.txt",header = FALSE,sep = ";",na.strings = "?",skip = 66637,nrows = 2880)
names(db) <- read.table("household_power_consumption.txt",sep=";",nrows = 1)
png(filename = "plot1.png", width = 480, height = 480)
hist(db$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")
dev.off()
