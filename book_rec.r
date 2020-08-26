library(plyr)
library(recommenderlab)
library(Matrix)
library(caTools)

book<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\RECCOMENDATION ALG\\data.csv")
View(book)
str(book)
#df<-data.frame(book$User.ID,book$Book.Title,book$Book.Rating)
#View(df)
#Lets check for NA values
is.na(book)
sum(is.na(book))
#is.nan(book)
#0 NA VALUES

#Lets plot to check if there are any biased values(Outliers)
boxplot(book$Book.Rating)
#there are few outliers 
#Since based on rating we decide outliers we can check for box plot .

hist(book$Book.Rating)
#most of the ratings given by user are 7 , 8 and then 9, 10

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix<-as(book,'realRatingMatrix')
book_matrix@data

#User Based Collaborative Filtering(UBCF)
model<-Recommender(book_matrix,method="UBCF")

#Predictions for all users 
recommended_books<-predict(model,book_matrix,n=1)
d<-as(recommended_books,"list")
d

#lets build model using popular model

pop_model<-Recommender(book_matrix,method="popular")
model_pred<-predict(pop_model,book_matrix,n=1)
data<-as(model_pred,"list")
data
