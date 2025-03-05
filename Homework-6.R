# To start simply, assume that the data in each of your treatment groups follow a normal distribution. Specify the sample sizes, means, and variances for each group that would be reasonable if your hypothesis were true. You may need to consult some previous literature and/or an expert in the field to come up with these numbers.

# Creating a dataframe 

my_data <- read.table(file="Lung.cells.KRT8positive.csv",
                      header=TRUE,
                      sep=",",
                      comment.char="#")

# inspect object
str(my_data)

shapiro.test(my_data$len)

var_a <- 1:9
var_b <- rep(c("PBS","CKO"),each=6)
var_c <- str(my_data)
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)

group_a <- rnorm(100, mean = 10, sd = 2)
WT<-rnorm(n=6, mean = 53, sd = 23)
CKO<-rnorm(n=6, mean = 55, sd = 21)
summary(WT)
hist(WT)
qqnorm(WT)

summary(CKO)
hist(CKO)
qqnorm(CKO)


PBS <-rnorm(n=6, mean = 61251, sd = 15314)
BLEO <-rnorm(n=6, mean = 31146, sd = 7724)

summary(PBS)
hist(PBS)
qqnorm(PBS)

summary(BLEO)
hist(BLEO)
qqnorm(BLEO)


