library(readxl)
library(ggplot2)
FRM_EM_Time_Series_FRM <- read_excel("/Users/vaughan/Desktop/Forecasting results_rom")
plot(FRM_EM_Time_Series_FRM$`Day-ahead Price [EUR/MWh]`~FRM_EM_Time_Series_FRM$Date,type="l", xlab = "Date", ylab = "Day-ahead Price [Euro/MWh]", col="blue",bg="transparent")
png(file='/Users/vaughan/Desktop/FRM@COM.png',width=1200,height=600,bg="transparent")
#p
dev.off()

#Multivariate
library(RColorBrewer)
data <- read_excel("/Users/vaughan/Desktop/FRM@COM_vs_CRIX.xlsx")
#FRM_EM_Time_Series_FRM_C <- read_excel("/Users/vaughan/Desktop/FRM@COM_CRIX.xlsx")
ggp1 <- ggplot(data, aes(Date)) +       # Create ggplot2 plot
  geom_line(aes(y = FRM_COM), color = "red") +
  geom_line(aes(y = FRM_COM_CRIX), color = "blue")
                                 # Draw ggplot2 plot
png(file='/Users/vaughan/Desktop/FRM@COM.png',width=1200,height=600,bg="transparent")
ggp1
dev.off()

######
data <- read_excel("/Users/vaughan/Desktop/Forecasting results_rom.xlsx")
plot(data$Date,                              # Draw first time series
     data$'Day-ahead Price [EUR/MWh]',
     type = "l",
     col = "blue",
     ylim = c(- 150, 200),
     xlab = "Time",
     ylab = "Day-ahead Price [EUR/MWh]")
#lines(data$Date,                             # Draw second time series
     # data$'Lasso 4',
     # type = "l",
      #col = 3)
lines(data$Date,                             # Draw third time series
    data$'Fuzzy-LLWNN',
      type = "l",
      col = 'red')
#lines(data$Date,                             # Draw third time series
    #  data$'RF 4',
    #  type = "l",
     # col = 6)
#legend("topright",                           # Add legend to plot
   #  c("Real Price", "Forecasted price"),
#    lty = 1,
 #    col = 2:4)

####

plot(data$Date, data$'price day ahead real',  col="blue", xlab="x", ylab="y")
# Ajouter une ligne
lines(data$Date, data$'Estimated price', col="red", type="b", lty=2)
# Ajouter une légende
legend(1, 95, legend=c("Real Price", "Estimated Price"),
       col=c("red", "blue"), lty=1:2, cex=0.8)
