library(readr)
household_power_consumption <- read_delim("exdata_data_household_power_consumption/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_datetime(format = "%d/%m/%Y "), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)
household_power_consumption<-subset(household_power_consumption,Date == "2007-02-01" | Date == "2007-02-02")

household_power_consumption$DateTime<-as.POSIXct(paste0(household_power_consumption$Date," ",household_power_consumption$Time))

png(file="plot3.png")

with(household_power_consumption,plot(x = DateTime,
                                      y = Sub_metering_1,
                                      type = "n",
                                      ylab = "Energy sub metering",
                                      xlab = ""))
with(household_power_consumption,points(x = DateTime,
                                        y = Sub_metering_1,
                                        type = "l"))
with(household_power_consumption,points(x = DateTime,
                                        y = Sub_metering_2,
                                        type = "l",
                                        col="red"))
with(household_power_consumption,points(x = DateTime,
                                        y = Sub_metering_3,
                                        type = "l",
                                        col="blue"))
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off() 

