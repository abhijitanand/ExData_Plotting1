library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Global_intensity = col_skip()), trim_ws = TRUE)
df <- household_power_consumption[household_power_consumption$Date>='2007-02-01' & household_power_consumption$Date<='2007-02-02',]
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(df$Global_active_power, col = "red" , xlab="Global Active Power(kilowatts)",main = "Global Active Power")
dev.off()