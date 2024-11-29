# Install and load necessary packages
install.packages("rpart")
library(rpart)

# Load the Iris dataset
data(iris)
head(iris)

# check for missing values
any(is.na(iris))
# removing null values(row)
iris <- na.omit(iris)

# rows and columns
dim(iris)

View(iris)

str(iris)



# Split the dataset into training and testing sets
set.seed(123)
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Build a decision tree model
tree_model <- rpart(Species ~ ., data = train_data, method = "class")

# Make predictions on the test set
predictions <- predict(tree_model, test_data, type = "class")

# Evaluate the model
confusion_matrix <- table(predictions, test_data$Species)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Print the confusion matrix and accuracy
print("Confusion Matrix:")
print(confusion_matrix)
cat("\nAccuracy:", accuracy)




# Take user input for a new observation
new_observation <- data.frame(
  Sepal.Length = as.numeric(readline("Enter Sepal Length: ")),
  Sepal.Width = as.numeric(readline("Enter Sepal Width: ")),
  Petal.Length = as.numeric(readline("Enter Petal Length: ")),
  Petal.Width = as.numeric(readline("Enter Petal Width: "))
)

# Make a prediction for the new observation
new_prediction <- predict(tree_model, new_observation, type = "class")

# Print the predicted species
cat("\nPredicted Species:", new_prediction, "\n")

if (new_prediction==1){
  print("setosa")
}else if(new_prediction==2){
  print("versicolor")
}else{
  print("cavirginin")
}
