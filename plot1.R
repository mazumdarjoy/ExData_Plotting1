

mydata1<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE)

mydata2 <- subset(mydata1, Date %in% c("1/2/2007","2/2/2007"))

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")

mydata2$Global_active_power<- as.numeric(mydata2$Global_active_power)

hist(mydata2$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power(Killowatt)")



