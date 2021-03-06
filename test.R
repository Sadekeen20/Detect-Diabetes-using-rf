library(neuralnet)
library(caret)
library(tidyverse)
library(mlbench)
library(e1071)


data("PimaIndiansDiabetes")
df<-PimaIndiansDiabetes
str(df)
?PimaIndiansDiabetes

ggplot(df,aes(diabetes,fill=factor(diabetes)))+
           geom_bar()

df$binary<-ifelse(df$diabetes=="neg",0,1)       
str(df)


rows<-createDataPartition(df$binary,times = 1,p=0.7,list=F)
train<-df[rows,]
test<-df[-rows,]

dim(train)
dim(test)

str(train)

names(train)

train<-train[,-9] # i removed the diabetes changed before

test<- test[,-9]

str(train)
str(test)


model<-train(as.factor(binary)~.,data=train,
             method="rf",
             trcontrol=trainControl(method = "repeatedcv"))

model

pred_test<-predict(model,test)
pred_test<-predict(model,test)
pred_train

confusionMatrix(pred_train,as.factor(train$binary))
confusionMatrix(pred_test,as.factor(test$binary))
