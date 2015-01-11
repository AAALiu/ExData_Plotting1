# load the data.table package
library(data.table)

# read the data from 2007-02-01 and 2007-02-02
data <- fread(paste("grep ^[12]/2/2007","household_power_consumption.txt"),na.strings =c("?"," "))
setnames(data,colnames(fread("household_power_consumption.txt",nrows=0)))

#convert the date/time variables to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot global active power towards DateTime
 par(mar=c(4,6,4,2),bg="white")
 plot(data$Global_active_power ~ data$DateTime,type="l", ylab="Global Active Power(kilowatts)",xlab="")
 
#save the plot to plot2.png
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
