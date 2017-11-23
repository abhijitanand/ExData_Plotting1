library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Global_intensity = col_skip()), trim_ws = TRUE)
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(df$Date_t, df$Global_active_power, type="n",ylab="Global Active Power" ,xlab="") 
lines(df$Date_t, df$Global_active_power, type="s") 

plot(df$Date_t, df$Voltage, type="n",ylab="Voltage" ,xlab="datetime") 
lines(df$Date_t, df$Voltage, type="s")

with(df, {plot(Date_t,Sub_metering_1,ylab="Energy Sub Metering" ,xlab="",type = "s")
  lines(Date_t,Sub_metering_2,type="s",col="red")
  lines(Date_t,Sub_metering_3,type="s",col="blue")})
legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(df$Date_t, df$Global_reactive_power, type="n",ylab="Global_reactive_power" ,xlab="datetime") 
lines(df$Date_t, df$Global_reactive_power, type="s") 
dev.off()