library(readr)
household_power_consumption <- read_delim("exdata_data_household_power_consumption/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_datetime(format = "%d/%m/%Y "), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)
household_power_consumption<-subset(household_power_consumption,Date == "2007-02-01" | Date == "2007-02-02")

png(file="plot1.png")

hist(household_power_consumption$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     col = "red")

dev.off() 