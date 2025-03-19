#probability distribution 
############################
# Function: my_histo
# Purpose: creates a ggplot histogram
# Requires: ggplot2
# Input: a numeric vector
# Output: a ggplot histogram
library(ggplot2)
my_histo <- function(x=NULL) {
  if(is.null(x)) df=data.frame(x=runif(1000)) else df<- data.frame(x=x)
  p1 <- ggplot(data=df) +
    aes(x=x) +
    geom_histogram(color="black",fill="goldenrod")
  print(p1)   
  
}
my_histo()

#first open library and than start line of code. will start function (df means dataframe, used null to start with no need of user input). x is numerical vector. null x the user didn`t give data. else df<- data.frame(x=x) is used in case the user gives a x value.`+ is used to add the different components of the code.p1 stands for plot 1. n values was artificially given 

library(MASS)
#standard to be used for stat functions

#-------------------------------------------------
# Poisson distribution
# Discrete X >= 0
# Random events with a constant rate lambda
# (observations per time or per unit area)
# Parameter lambda > 0
#note:"zero-inflated poisson" has an additional process
#generating zeros(see ifelse())
#note:"zero-censored poisson" occurs when zeroes are not recorded

# "d" function generates probability density
hits <- 0:10
myVec <- dpois(x=hits,lambda=1)
my_histo(myVec)
plot(myVec,type="b") #added a line between points

hits<- 0:50
my_Vec<- dpois(x=hits, lambda=20)
plot(myVec,type="b")

myVec <- dpois(x=hits,lambda=2)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))

hits <- 0:15
myVec <- dpois(x=hits,lambda=6)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))


hits <- 0:15
myVec <- dpois(x=hits,lambda=0.2)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))

sum(myVec)  # sum of density function = 1.0 (total area under curve)
head(myVec)
# for a Poisson distribution with lambda=2, 
# what is the probability that a single draw will yield X=0?
# sum of density function = 1.0 (total area under curve)

# for a Poisson distribution with lambda=2, 
# what is the probability that a single draw will yield X=0?lative

dpois(x=0,lambda=2)

# "p" function generates cumulative probability density; gives the 
# "lower tail" cumulative area of the distribution

hits <- 0:10
myVec <- ppois(q=hits,lambda=2)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))
plot(myVec,type="b") # using this plot myVec and type gets the data in dots and lines 


# for a Poisson distribution with lambda=2, 
# what is the probability of getting 1 or fewer hits?

ppois(q=1, lambda=2)


# We could also get this through dpois
p_0 <- dpois(x=0,lambda=2)
p_0
p_1 <- dpois(x=1,lambda=2)
p_1
p_0 + p_1


# The q function is the inverse of p
# What is the number of hits corresponding to 50% of the probability mass
qpois(p=0.5,lambda=2.5)
qplot(x=0:10,y=dpois(x=0:10,lambda=2.5),geom="col",color=I("black"),fill=I("goldenrod"))

# but distribution is discrete, so this is not exact
ppois(q=2,lambda=2.5)

# finally, we can simulate individual values from a poisson
ranPois <- rpois(n=1000,lambda=2.5)
qplot(x=ranPois,color=I("black"),fill=I("goldenrod"))


#ranpois will simulate data


# for real or simulated data, we can use the quantile
# function to find the empirical  95% confidence interval on the data

quantile(x=ranPois,probs=c(0.025,0.975))


#-------------------------------------------------
# Binomial distribution
# p = probability of a dichotomous outcome
# size = number of trials
# x = possible outcomes
# outcome x is bounded between 0 and number of trials

# use "d" binom for density function
hits <- 0:10
myVec <- dbinom(x=hits,size=10,prob=0.5)
qplot(x=0:10,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))
plot(myVec,type="b")

# and how does this compare to an actual simulation of 50 tosses of 100 coins?

myCoins <- rbinom(n=50,size=100,prob=0.5)
#size is number of trials
qplot(x=myCoins,color=I("black"),fill=I("goldenrod"))
my_histo(myCoins)
quantile(x=myCoins,probs=c(0.025,0.975))

myCoins <- rbinom(n=5000,size=100,prob=0.5)
#size is number of trials
qplot(x=myCoins,color=I("black"),fill=I("goldenrod"))
my_histo(myCoins)
quantile(x=myCoins,probs=c(0.025,0.975))


#-------------------------------------------------
# negative binomial: number of failures (values of MyVec)
# in a series of (Bernouli) with p=probability of success 
# before a target number of successes (= size)
# generates a discrete distribution that is more 
# heterogeneous ("overdispersed") than Poisson
hits <- 0:40
myVec <- dnbinom(x=hits, size=5, prob=0.5)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))
plot(myVec,type="b")

# geometric series is a special case where N= 1 success
# each bar is a constant fraction 1 - "prob" of the bar before it. each is 90% of the one that came before
myVec <- dnbinom(x=hits, size=1, prob=0.1)
qplot(x=hits,y=myVec,geom="col",color=I("black"),fill=I("goldenrod"))
plot(myVec,type="b")

#### after spring break March 18, 2025
