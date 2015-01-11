# load the data.table package
library(data.table)

# read the data from 2007-02-01 and 2007-02-02
data <- fread(paste("grep ^[12]/2/2007","household_power_consumption.txt"),na.strings =c("?"," "))
setnames(data,colnames(fread("household_power_consumption.txt",nrows=0)))

#convert the date/time variables to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot energy sub metering towards DateTime
 par(mar=c(6,6,4,2),bg="white")
 plot(data$Sub_metering_1 ~ data$DateTime,type="l", ylab="Energy sub metering",xlab="")
 lines(data$DateTime,data$Sub_metering_3, col="blue")
 lines(data$DateTime,data$Sub_metering_2, col="red")
 legend("topright", pch="", lwd =1, col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

 
#save the plot to plot3.png
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
