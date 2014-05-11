##Coursera Data Science Specialization
##Exploratory Data Analysis
##Assignment 1
##Electric power consumption data: Plot 2
##Author: Mario Albuquerque
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

##PLOT 2
##Convert time column into characters
dataElectricity$Time<-as.character(dataElectricity$Time)
##Concatenate Date with Time
Date_Time<-paste(dataElectricity$Date,dataElectricity$Time)
##Convert new date_time_col to POSIXxt object
Date_Time<-as.POSIXct(Date_Time)
##Add new Date+Time column after the Time column in the dataset
dataElectricity<-cbind(dataElectricity[,1:2],Date_Time,dataElectricity[,3:data_cols])
##Create .png file of the plot
png(filename='plot2.png',width=480,height=480,units='px')
##Make plot
plot(dataElectricity$Date_Time,dataElectricity$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
##Close the plot
dev.off()
