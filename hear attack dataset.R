#Read a CSV file from PC
x <- read.csv("C:/Users/Keltron/Downloads/heart (7).csv")
x
tail(x)
str(x)


x$target <- as.factor(x$target)


#Barplot
ggplot(x,aes(x = age,fill = target))+
  geom_bar()+
  ggtitle("Bar chart if heart attack patients")+
  xlab("Age")+
  ylab("Count")+
  scale_fill_manual(values = 
                      c("1" = "red", "0" = "green"))

#
ggplot(x,aes(x = target,fill = target))+
  geom_bar()+
  ggtitle("Bar chart of heart attack patients")+
  xlab("thal")+
  ylab("Count")+
  scale_fill_manual(values = 
                      c("1" = "red", "0" = "green"))

#Boxplot
ggplot(x,aes(x = age,y=target,fill = target))+
  geom_boxplot()+
  ggtitle("Boxplot of heart attack patients")+
  xlab("Age")+
  ylab("Target")+
  scale_fill_manual(values = 
                      c("1" = "red", "0" = "green"))

#Piechart
ggplot(x,aes(x = "",fill = target))+
  geom_bar()+
  coord_polar(theta = "y")+
  ggtitle("Pie chart of heart attack patient")+
  theme_void()+
  scale_fill_manual(values = 
                      c("1" = "red", "0" = "green"))

#Linechart
ggplot(x,aes(x = age,y = chol, colour  = target ))+
  geom_line()+
  ggtitle("Linechart of heart attack patients")+
  xlab("Age")+
  ylab("Cholestrol")+
  scale_colour_manual(values = 
                        c("1" = "red", "0" = "green"))
#Heatmap
corrgram(x,lower.panel = panel.shade,upper.panel = panel.cor)
warnings()
  

  

  