#Course: Exploratory Data Analysis
#Name: Priscila Valdiviezo
dataset <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE) 
dataset$Date<-as.Date(dataset$Date,format='%d/%m/%Y')
dataset2<-subset(dataset,Date%in%as.Date(c("2007-02-01","2007-02-02")))
head(dataset2)
dataset2$DateTime=as.POSIXct(paste(dataset2$Date,dataset2$Time))
dataset2$Global_active_power<-as.numeric(dataset2$Global_active_power)
DateTime<-dataset2$DateTime

##Plot 3
png("plot3.png", width=480, height=480)
with(dataset2,plot(x=DateTime,y=Sub_metering_1,xlab="",type="l",ylab="Energy sub metering"))
lines(x=DateTime,y=dataset2$Sub_metering_2,col="red")
lines(x=DateTime,y=dataset2$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
