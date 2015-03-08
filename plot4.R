## Reading the Consumption data from the specified file
Econsump_data <- read.csv("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F,na.strings="?")
## subsetting only the Feb1st data
data_feb1st <- subset(Econsump_data,Date=="1/2/2007")
## subsetting only the Feb2nd data
data_feb2nd <- subset(Econsump_data,Date=="2/2/2007")
### combining both dates data using rbind
required_Data <- rbind(data_feb1st,data_feb2nd)
required_Data$Date <- as.Date(required_Data$Date, format="%d/%m/%Y")

rm(Econsump_data)

## Converting dates
datetime <- paste(required_Data$Date, required_Data$Time)
required_Data$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)

## Plot 4
par(mfrow=c(2,2))
with(required_Data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()