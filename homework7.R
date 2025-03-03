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

iris4<-mutate(iris3, ratio = Sepal.Length*Sepal.Width)
head(iris4)

iris5<-summarize(iris4, Sepal_average_Length = mean(Sepal.Length), Sepal_average_Width = mean(Sepal.Width),Sample_Size = n())
print(iris5)
iris6<-group_by(iris, Species)
summarize(iris4, Sepal_average_Length = mean(Sepal.Length), Sepal_average_Width = mean(Sepal.Width),Sample_Size = n())
print(iris6)


irisFinal<-filter(iris,Species != "setosa", Sepal.Length > 6, Sepal.Width > 2.5) %>%
  group_by(Species) %>%
  summarize(Sepal_average_Length = mean(Sepal.Length), Sepal_average_Width = mean(Sepal.Width),Sample_Size = n()) 
print(irisFinal)

iris %>%
  pivot_longer(cols= Measure:Value,
               names_to = "Sepal.Length",
               values_to= "Species",
               values_drop_na = T)
library(tidyverse)
data("iris")
class(iris)
glimpse(iris)
iris %>%
  pivot_longer(cols=Sepal.Length:Sepal.Width:Petal.Length:Petal.Width,
               names_to = "measure",
               values_to= "value",
               values_drop_na = T)
