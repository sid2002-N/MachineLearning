x <- read.csv("C:/Users/Keltron/Downloads/heart (7).csv")
x
library(rpart)

#check for missing values
any(is.na(x))

#removing all null values
x <- na.omit(x)

#rows and columns
dim(x)
View(x)
str(x)

#split the datasets into training and testing sets
set.seed(123)
sample_index <- sample(1:nrow(x),0.7*nrow(x))
train_data <- x[sample_index,]
test_data <- x[-sample_index,]

#build a decision tree model
tree_model <- rpart(target ~ .,data = train_data , method = "class")

# Make predictions on the test set
predictions <- predict(tree_model, test_data, type = "class")

# Evaluate the model
confusion_matrix <- table(predictions, test_data$target)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Print the confusion matrix and accuracy
print("Confusion Matrix:")
print(confusion_matrix)
cat("\nAccuracy:", accuracy)


new_observatio <- data.frame(
  columns = c("age","sex","cp","trestbps", "chol", "fbs" ,"restecg" ,"thalach" ,"exang" ,"oldpeak" ,"slope" ,"ca" ,"thal"),
  values = c(6,1,3,1,2,1,0,1,0,0,0,0,1))
new_observatio
# Convert to a single-row data frame
final_observation <- as.data.frame(t(new_observatio$values))
colnames(final_observation) <- new_observatio$columns

# Display the final observation
print(final_observation)


#new_obs <- as.array(new_observatio)


new_observation <- data.frame(
         age   =c(63),
         sex   =c(1),
         cp    =c(3),
     trestbps  =c(145),
         chol  =c(233),
         fbs   =c(1),
      thalach  =c(150),
       exang   =c(0),
       slope   =c(0),
         ca    =c(0),
       thal    =c(1),
     restecg   =c(1),
     oldpeak   =c(1.0)
     )
 
new_observation
         

new_prediction <- predict(tree_model, final_observation, type = "class")
cat("Target:",new_prediction,"\n")
new_prediction

if(new_prediction == "0"){
  print("The patient dont have heart disease")
}else if(new_prediction == "1"){
  print("The patient have heart disease")
}else{
  print("none")
}
