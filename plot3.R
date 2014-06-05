setwd("~/FORMACION/Coursera/Exploratory_Data_Analysis//week_1/project1/")

#### read data
EPC <- read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?")
EPC$DateTime <- paste(EPC$Date,EPC$Time)
EPC$DateTime2 <- as.POSIXct(strptime(EPC$DateTime, "%d/%m/%Y %H:%M:%S"))


head(EPC)
str(EPC)
## Select data: using data from the dates 2007-02-01 and 2007-02-02
select <- subset(EPC[EPC$Date=="1/2/2007" | EPC$Date=="2/2/2007",])
str(select)
## plot3: Energy sub metering ~ DateTime
png(filename="plot3.png")
plot(select$DateTime2, select$Sub_metering_1, col="black", ylab="Energy sub metering", xlab="", type="l")
lines(select$DateTime2, select$Sub_metering_2, col="red")
lines(select$DateTime2, select$Sub_metering_3, col="blue")
legend("topright",cex=0.5,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1)
dev.off()
