#4february 2025
#Matrix is a atomic vector that os organized into rows and columms

my_vec<- 1:12
m <- matrix(data=my_vec,nrow=4)
print(m)
#set of brackets to define rows and columms, as seem 4 by 4

m <- matrix(data=my_vec,nrow=3)
print(m)

# filled vertically
#optional parameter to change. FALSE will be by columm. 

m <- matrix(data=my_vec,nrow=3,byrow=FALSE)
print(m)

m <- matrix(data=my_vec,nrow=3,byrow=TRUE)
print(m)

my_list <-list(1:10,
               matrix(1:8,nrow=4,byrow=TRUE),
               letters[1:3],
               pi)
str(my_list)
print(my_list)

# using [] gives you a single item, which is of type list
my_list[4]
my_list[4] - 3 # no, can't subtract a number from a list!


# single brackets gives you only the element in that slot, which is always of type list
#double brackets need to be used to get the contents of the list 

# to grab the object itself, use [[]]
my_list[[4]]
my_list[[4]] - 3 # now we have the contents

my_list <-list(1:10,
               matrix(1:8,nrow=4,byrow=TRUE),
               letters[1:3],
               pi)
str(my_list)
print(my_list)

my_list[[4]]
my_list[[4]] -3

# once the double bracket is called, you can access individual elements as before

my_list[[2]]
my_list[[2]][4,1]

# name list items when they are created


my_list2 <- list(tester=FALSE,little_m=matrix(1:9,nrow=3))
#tester bolean value 

# named elements can be accessed with dollar sign

my_list2$little_m[2,3] # get row 2, column3
my_list2$little_m # show whole matrix
my_list2$little_m[2,] # show second row, all columns.,Empty is to give all the columms of the second row
my_list2$little_m[,2]#All second row
my_list2$little_m[,] #show whole matrix
my_list2$little_m[2] # what does this give you? For me gave 2. Not the best way to work. #Doesn`t give error but might not be specific enough

#unlist option 

# The "unlist" strings everything back into
# a single atomic vector; coercion is used if there are mixed data types

unrolled <- unlist(my_list2)
print(unrolled)

# The most common use of list: output from a linear model is a list

my_vec<- 1:12
m <- matrix(data=my_vec,nrow=4)
print(m)
library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var,y=y_var)

print(my_model)

print(summary(my_model))

# drill down into summary to get what we want
str(summary(my_model))
summary(my_model)$coefficients

# drill down into summary to get what we want
str(summary(my_model))
summary(my_model)$coefficients
summary(my_model)$coefficients["x_var","Pr(>|t|)"]
summary(my_model)$coefficients[2,4]

# use unlist instead

u <- unlist(summary(my_model))
print(u)

my_slope <- u$coefficients2
my_pval <- u$coefficients

# a data frame is a list of equal-lengthed vectors, each of which is a column

var_a <- 1:12
var_b <- rep(c("Con","LowN","HighN"),each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
#need all to be from the same data type and lenght)
print(d_frame)
str(d_frame)
`

