#Read in the data
powerdata <- read.table("household_power_consumption.txt", sep= ";", header = TRUE) 
##Filters down to interested dates
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
interesteddates <- rbind(subset(powerdata,Date == "2007-02-01"), subset(powerdata,Date == "2007-02-02"))
interesteddates <- interesteddates[complete.cases(interesteddates),]

##Make 3rd plot
legendtitles <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colorsforlines <- c("black","red","blue")
plot(interesteddates2$FullTime,interesteddates2$Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="   ")
lines(interesteddates2$FullTime, interesteddates2$Sub_metering_2 ,col='Red') 
lines(interesteddates2$FullTime, interesteddates2$Sub_metering_3 ,col='Blue') 

legend("topright", legend= legendtitles, col=colorsforlines, lty="solid")