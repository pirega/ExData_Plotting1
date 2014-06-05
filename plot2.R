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
## plot2: Global Active Power (kilowatts) ~ DateTime
png(filename="plot2.png")
plot(select$DateTime2,select$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
