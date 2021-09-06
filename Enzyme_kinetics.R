sessionInfo()
setwd('/Users/calenmendall/Desktop/r projects')
EnzymeKinetics <- read.csv("Enzyme Lab Data.csv")

#Checking out data and adjusting as necessary

head(EnzymeKinetics)

Temp <- gsub("°C","", EnzymeKinetics$Tempurature)

EnzymeKinetics <- cbind(EnzymeKinetics, Temp)

#Generating subsets of data

Tissuetail <- EnzymeKinetics[EnzymeKinetics$Tissue.Type == "Tail",]
TissuePAM <- EnzymeKinetics[EnzymeKinetics$Tissue.Type == "PAM",]

#Setting parameters and colors for histogram and boxplots
par(mfrow = c(1,1))
col2rgb(c('blue','red'))
transred <- rgb(255, 0, 0, max = 255, alpha = 200, names = "red")
transblue <- rgb(0, 0, 255, max = 255, alpha = 200, names = "blue")

#Graphs comparing enzyme activity
hist(TissuePAM$I.U..gfw,
     breaks = 15,
     xlim = c(10,40),
     ylim = c(0,15),
     xlab = "Enzyme activity",
     col = transblue,
     main = "Histogram of enzyme activity (I.U..gfw)",
     )
hist(Tissuetail$I.U..gfw,
     breaks = 20,
     xlim = c(10,40),
     ylim = c(0,15),
     xlab = "Tail activity",
     col = transred,
     main = "", 
     add = TRUE,
     )
legend("topright", c("PAM", "Tail"), fill=c("blue", "red"))

boxplotcolors <- c('blue','red','green')

boxplot(I.U..gfw ~ Temp, TissuePAM,
        col= boxplotcolors,
        xlab = "Temperature (°C)",
        main = "PAM activity at varying temperatures")

boxplot(I.U..gfw ~ Temp, Tissuetail, 
        col= boxplotcolors,
        xlab = "Temperature (°C)",
        main = "Tail activity at varying temperatures" )

#Statistics of activity
summary(TissuePAM)
summary(Tissuetail)

summary(aov(I.U..gfw ~Temp, TissuePAM))
summary(aov(I.U..gfw ~Temp, Tissuetail))
summary(aov(I.U..gfw ~Tissue.Type, EnzymeKinetics))

