hp <- read.table("household_power_consumption.txt", header=TRUE, sep=';')
hp$Date <- as.Date(hp$Date, format="%d/%m/%Y")
hp_req <- hp_test[(hp$Date=="2007-02-01") | (hp$Date=="2007-02-02"),]
hp_req <- transform(hp_req, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
hp_req$Sub_metering_1 <- as.numeric(as.character(hp_req$Sub_metering_1))
hp_req$Sub_metering_2 <- as.numeric(as.character(hp_req$Sub_metering_2))
hp_req$Sub_metering_3 <- as.numeric(as.character(hp_req$Sub_metering_3))

plot3 <- function() {
        plot(hp_req$timestamp,hp_req$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(hp_req$timestamp,hp_req$Sub_metering_2,col="red")
        lines(hp_req$timestamp,hp_req$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))      
        dev.copy(png,"plot3.png")
        dev.off()
}
plot3()