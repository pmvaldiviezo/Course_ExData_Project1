#Course:Exploratory Data Analysis
#Name: Priscila Valdiviezo
dataset <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE) 
dataset$Date<-as.Date(dataset$Date,format='%d/%m/%Y')
dataset2<-subset(dataset,Date%in%as.Date(c("2007-02-01","2007-02-02")))
head(dataset2)
dataset2$DateTime=as.POSIXct(paste(dataset2$Date,dataset2$Time))
dataset2$Global_active_power<-as.numeric(dataset2$Global_active_power)
DateTime<-dataset2$DateTime

#Plot 1
png(file="plot1.png",width = 480,height = 480)
hist(dataset2$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power") 
dev.off()
