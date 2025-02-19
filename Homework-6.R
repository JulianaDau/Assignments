# To start simply, assume that the data in each of your treatment groups follow a normal distribution. Specify the sample sizes, means, and variances for each group that would be reasonable if your hypothesis were true. You may need to consult some previous literature and/or an expert in the field to come up with these numbers.

# Creating a dataframe 

my_data <- read.table(file="Lung.cells.KRT8positive.csv",
                      header=TRUE,
                      sep=",",
                      comment.char="#")

# inspect object
str(my_data)

var_a <- 1:12
var_b <- rep(c("PBS","CKO"),each=6)
var_c <- my_data
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)


WT<-rnorm
rnorm(n=6, mean = 50, sd = 10)
print(WT)
plot(WT)
CKO<-rnorm
rnorm(n=6, mean = 50, sd = 20)
print(WT)
print (CKO)
plot(x=WT)



