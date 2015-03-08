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


png("plot2.png",width=480,height=480)

plot(required_Data$Global_active_power~required_Data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()