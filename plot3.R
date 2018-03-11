mydata1<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE)

mydata2 <- subset(mydata1, Date %in% c("1/2/2007","2/2/2007"))

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")
mydata2$Sub_metering_1<- as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2<- as.numeric(mydata2$Sub_metering_2)
mydata2$Sub_metering_3<- as.numeric(mydata2$Sub_metering_3)

mydata2$date_new<- as.POSIXct(paste(mydata2$Date, mydata2$Time), format = "%Y-%m-%d %H:%M:%S")


ggplot(mydata2, aes(mydata2$date_new,mydata2$Global_active_power))+
  geom_line(aes(y = mydata2$Sub_metering_1, colour = "Sub_metering_1"))+
  geom_line(aes(y = mydata2$Sub_metering_2, colour = "Sub_metering_2"))+
  geom_line(aes(y = mydata2$Sub_metering_3, colour = "Sub_metering_3"))+
  labs(y = "Energy Sub Metering", x ="")+
  scale_x_datetime(labels = date_format("%a"),date_breaks = "1 day" )+
 theme(legend.position = c(0.8,0.8))
