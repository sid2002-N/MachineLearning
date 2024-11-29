library("randomForest")

heart <- read.csv("C:/Users/Keltron/Downloads/heart (7).csv")
heart

any(is.na(heart))

heart <- na.omit(heart)

dim(heart)

str(heart)

set.seed(123)
