mydata1<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    stringsAsFactors = FALSE)

mydata2 <- subset(mydata1, Date %in% c("1/2/2007","2/2/2007"))

mydata2$Date <- as.Date(mydata2$Date, format="%d/%m/%Y")

mydata2$Global_active_power<- as.numeric(mydata2$Global_active_power)

mydata2$date_new<- as.POSIXct(paste(mydata2$Date, mydata2$Time), format = "%Y-%m-%d %H:%M:%S")


ggplot(mydata2, aes(mydata2$date_new,mydata2$Global_active_power))+geom_line()+
  labs(y = "Global Active Power (Killowatts)", x ="")+
  scale_x_datetime(labels = date_format("%a"),date_breaks = "1 day" )

