## Reading the Consumption data from the specified file
Econsump_data <- read.csv("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F,na.strings="?")
## subsetting only the Feb1st data
data_feb1st <- subset(Econsump_data,Date=="1/2/2007")
## subsetting only the Feb2nd data
data_feb2nd <- subset(Econsump_data,Date=="2/2/2007")
### combining both dates data using rbind
required_Data <- rbind(data_feb1st,data_feb2nd)
### checking the variables inside the required_Data
names(required_Data)

#####attaching the data to the console

attach(required_Data)


png("plot1.png",width=400,height=400)

#### plotting the histogram for the required column and adding main title and x label
hist(Global_active_power,
freq=TRUE,
main="Global Active Power",
xlab="Global Active Power(kilowatts)",
col="red")

dev.off()



