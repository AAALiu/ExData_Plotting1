# load the data.table package
library(data.table)

# read the data from 2007-02-01 and 2007-02-02
data <- fread(paste("grep ^[12]/2/2007","household_power_consumption.txt"),na.strings =c("?"," "))
setnames(data,colnames(fread("household_power_consumption.txt",nrows=0)))

#convert the date/time variables to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#set the margins and background of the plot
par(mar=c(8,6,4,1),bg="white")


#plot the histgram
hist(data$Global_active_power,breaks=12,col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power(kilowatts)")

#save the plot to plot1.png
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
