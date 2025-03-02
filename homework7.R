#Homework 7

data(iris)

library(tidyverse)
data("iris")
class(iris)



filter(iris, Species != "setosa", Sepal.Length > 6, Sepal.Width > 2.5)

iris1<-filter(iris, Species != "setosa", Sepal.Length > 6, Sepal.Width > 2.5)
iris2<-select(iris1, Sepal.Length, Sepal.Width, Species)
iris3<-arrange(iris2, by = desc(Sepal.Length))
print(iris3)
head(iris3)
select(iris3,rows=6)
