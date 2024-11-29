library(ggplot2)
library(wordcloud)
library(corrgram)


#load the iris dataset
data(iris)

head(iris)
tail(iris)
iris
#info
str(iris)
dim(iris)
#value count
table(iris$Species)

#Barchart
ggplot(iris,aes(x=Sepal.Length,fill = Species))+
  geom_bar()+
  ggtitle("Bar chart of iris species")+
  xlab("Species")+
  ylab("Count")+
  scale_fill_manual(values = 
                      c("setosa" = "blue","versicolor"="green","virginica"="red"))

#Boxplot
ggplot(iris,aes(x = Species, y = Sepal.Length,fill = Species))+
  geom_boxplot()+
  ggtitle("Boxplot of Sepal Length by Iris Species")+
  xlab("Species")+
  ylab("Sepal Length")+
  scale_fill_manual(values = 
                      c("setosa" = "blue","versicolor"="green","virginica"="red"))

#Pie chart
ggplot(iris,aes(x="",fill=Species))+
  geom_bar()+
  coord_polar(theta = "y")+
  ggtitle("Pie Chart of Iris Species")+
  theme_void()+
  scale_fill_manual(values = 
                      c("setosa" = "blue","versicolor"="green","virginica"="red"))

#Line Chart
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,colour = Species))+
  geom_line()+
  ggtitle("Line Chart of Sepal Length vs Sepal Width by Iris Species")+
  xlab("Sepla Length")+
  ylab("Sepal Width")+
  scale_colour_manual(values = 
                        c("setosa" = "blue","versicolor"="green","virginica"="red"))

#Heatmap
corrgram(iris,lower.panel = panel.shade,upper.panel = panel.cor)

#word cloud
#Sample text data
 text_data <-"This is the sample text for creating the word cloud. Word clouds are the visual representation of text data, where the size of each word indicates its frequency in the given text.HTML stands for Hyper Text Markup Language
HTML is the standard markup language for creating Web pages
HTML describes the structure of a Web page
HTML consists of a series of elements
HTML elements tell the browser how to display the content
HTML elements label pieces of content such as this is a heading, this is a paragraph, this is a link etc.
"
 
#Generate word frequencies
 word_freq <- table(strsplit(text_data," ")[[1]])
 word_freq
 
 #Create word cloud
 wordcloud(word = names(word_freq), freq = word_freq,scale = c(1,6),colors = brewer.pal(8, "Set3"))
  