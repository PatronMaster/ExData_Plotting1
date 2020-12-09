library(readr)
household_power_consumption <- read_delim("exdata_data_household_power_consumption/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_datetime(format = "%d/%m/%Y "), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)
household_power_consumption<-subset(household_power_consumption,Date == "2007-02-01" | Date == "2007-02-02")

household_power_consumption$DateTime<-as.POSIXct(paste0(household_power_consumption$Date," ",household_power_consumption$Time))

png(file="plot2.png")

with(household_power_consumption,plot(x = DateTime,
                                      y = Global_active_power,
                                      type = "l",
                                      ylab = "Global Active Power (kilowatts)",
                                      xlab = ""))

dev.off() 
