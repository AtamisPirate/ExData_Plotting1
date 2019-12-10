#Read in the data
powerdata <- read.table("household_power_consumption.txt", sep= ";", header = TRUE) 
##Filters down to interested dates
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
interesteddates <- rbind(subset(powerdata,Date == "2007-02-01"), subset(powerdata,Date == "2007-02-02"))
interesteddates <- interesteddates[complete.cases(interesteddates),]

##Make 2nd plot
FullTime <- paste(interesteddates$Date, interesteddates$Time)
interesteddates2 <- cbind(FullTime, interesteddates)
interesteddates2$FullTime <- as.POSIXct(FullTime)

plot(interesteddates2$FullTime,interesteddates2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="   ")