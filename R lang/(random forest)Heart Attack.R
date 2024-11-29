install.packages("randomForest")
library(randomForest)

heart <- read.csv("C:/Users/Keltron/Downloads/heart (7).csv")
heart

str(heart)

heart$target <- as.factor(heart$target)

set.seed(123)
train_indices <- sample(1:nrow(heart), 0.7 * nrow(heart))
train_data <- heart[train_indices, ]
test_data <- heart[-train_indices, ]

rf_model <- randomForest(target ~ ., data = train_data, ntree =500)

predictions <- predict(rf_model, test_data)
print(predictions)

confusion_matrix <- table(predictions, test_data$target)
print(confusion_matrix)

accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy: ", accuracy))


