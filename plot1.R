##Coursera Data Science Specialization
##Exploratory Data Analysis
##Assignment 1
##Electric power consumption data: Plot 1
##Student: Mario Albuquerque

##Load data
fileName<-'household_power_consumption.txt'
temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
raw_dataElectricity <- read.table(unz(temp, fileName),header=TRUE,sep=';',na.strings='?')
unlink(temp)
##Get rid of invalid data
raw_dataElectricity<-na.omit(raw_dataElectricity)
##Convert to dates
raw_dataElectricity$Date<-as.Date(raw_dataElectricity$Date,format='%d/%m/%Y')
##Subset within relevant dates
dataElectricity<-raw_dataElectricity[raw_dataElectricity$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
##Convert data to numerical (only after 'Date' and 'Time' columns)
data_cols<-ncol(dataElectricity)
for (i in 3:data_cols){
    dataElectricity[,i]<-as.numeric(dataElectricity[,i])
    
}
##Create .png file of the plot
png(filename='plot1.png',width=480,height=480,units='px')
##Plot the histogram
hist(dataElectricity$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)',ylim=c(0,1200))
##Close the plot
dev.off()
