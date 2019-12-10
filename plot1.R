#Read in the data
powerdata <- read.table("household_power_consumption.txt", sep= ";", header = TRUE) 
##Filters down to interested dates
powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
interesteddates <- rbind(subset(powerdata,Date == "2007-02-01"), subset(powerdata,Date == "2007-02-02"))
interesteddates <- interesteddates[complete.cases(interesteddates),]
##Make 1st plot Histogram Global active power
interesteddates$Global_active_power <- as.character(interesteddates$Global_active_power)
interesteddates$Global_active_power <- as.double(interesteddates$Global_active_power)
hist(interesteddates$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col ="red")