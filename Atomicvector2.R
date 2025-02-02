#More properties of atomic vectors
#30 January 2025
  
# create an empty vector, specify mode & length
z <- vector(mode="numeric",length=0)  
print(z)

#now add elements to it 

z <- c(z,5)
print(z)
# This "dynamic sizing" is very SLOW!

# has 100 0s in a numeric vector
z <- rep(NA,100) 
head(z)
#observation head limits to just 6 numbers
#leaving just 0 can be problematic so can change 0 to NA

# has 100 0s in a numeric vector
z <- rep(0,100) 
head(z)

# but would be better to start with NAs
z <- rep(NA,100)
head(z)

# but what is its type?
typeof(z)

# take advantage of coercion!
z[1] <- "Washington"
head(z)
typeof(z[2])

my_vector <- runif(100)
my_names <- paste("Species",seq(1:length(my_vector)),sep="")
head(my_names)
names(my_vector) <- my_names
head(my_vector)
str(my_vector)

#function past is what we are using and the label in the case above is species.
#make sequence starting from 1 to lenght of the vector which in this case is 100
# parameter sep stands for separator and stich whith no blank space between 
#characters my_names for the variables 

# rep for repeating elements
rep(0.5,6) # give the element (or vector!) and number of times to repeat
rep(x=0.5,times=6) # using the argument names is always prudent
rep(times=6,x=0.5) # with argument names, order is not important
my_vec <- c(1,2,3)
rep(x=my_vec,times=2) # applies to entire vectors.Repeat entire vector twice
rep(x=my_vec,each=2) # repeat each element individually in place of using time
#instead of doing 1 2 3 1 2 3 (times) it gives 1 1 2 2 3 3  when used each 
rep(x=my_vec,times=my_vec) # what does this do?
rep(x=my_vec,each=my_vec) # and this? code runs but we get a warning message 
#warning says: In rep(x = my_vec, each = my_vec) : first element used of 'each'
#argument. Needs a single number but was given a vector. 

#item that we want repeated rep(0.5,6)

seq(from=2, to=4) # set limits for integer sequences
2:4 # very common short cut with no explicit function wrappers
`:`(2,4) # option to not ype the seq
seq(from=2,to=4,by=0.5) # use a by function can generate real numbers
seq(from=2,to=4,by=0.67) # see that only gives 2 values to not go beyond limit
print(x)
x <- seq(from=2, to=4,length=7) # sometimes easier to just specify the length
my_vec <- 1:length(x) # commonly used, but actually slow
print(my_vec)
seq_along(my_vec) #much faster for models and big data! takes and add a interval
seq_len(5) # this is also faster than 1:5

runif(5) # 5 random uniform values betweeon 0 and 1.That is the degfalt if not specified 
runif(n=3,min=100, max=101) # 3 random uniform values between 100 and 101. Specified the range

rnorm(6) # 6 random normal values with mean 0 and standard deviation 1
#rnormal gives random number values
rnorm(n=5, mean=100, sd=30) # 5 random normal values with mean 100 and sd 30

## Explore distributions by sampling and plotting
library(ggplot2) # do this at the very start. Call ggplot package
z <- runif(10000) #default uniform (0,1)
qplot(x=z)
z <- rnorm(10000) #default normal (0,1). If you remove this line of the normal distribution see how messy the plot looks. Also just altering from 1000 to 10000 also looks better (changed on the runif and rnorm)
qplot(x=z)

long_vec <- seq_len(10)
typeof(long_vec)
str(long_vec)

sample(x=long_vec) # with no other params, this reorders the vector
sample(x=long_vec, size=3) # specify a number (sampling without replacement) will not see a repeat value when using the default. But when using like size 11 will give a error because there is not enough options to pull 
sample(x=long_vec,size=16,replace=TRUE) # can generate duplicates. Some will be repeated but might not get all the numbers. In this case probability is the same 
my_weights <- c(rep(20,5),rep(100,5)) # create a set of non-zero positive weights (integer or real). Some observations are more likely. Combination and rep function. Will be biased to larger numbers
print(my_weights)
sample(x=long_vec,replace=TRUE,prob=my_weights) # sampling with replacement and weights
sample(x=long_vec,replace=FALSE,prob=my_weights) # sampling without replacement and weights
sample(x=long_vec,replace=TRUE,prob=long_vec) # what does this do?Probability are the vector element themselves that will indicate probability. So will show higher values. See that higher chances of getting 10, 9,8,7,... That does not mean you won`t get lower. 

z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

# positive index values
z[c(2,3)]

# negative index values to exclude elements. give everything except what is inside
z[-c(2,3)]

# create a vector of logical elements to select conditions.Inequality statement z, refers to the numerical value of 3. 

z[z<3]

# equivalent to the following. Gives TRUE and FALSE
tester <- z<3
print(tester)
z[tester]

# also use which() function to find subscript indicators.Which apply to inequality in this case 3 and 4
which(z<3)

# this works, but is overkill; just use the boolean operator
z[which(z<3)]

# can also use length() for relative positioning to last element. Negative sign is what we want to leave out.
z[-(length(z):(length(z)-2))]

# also can subset using named vector elements
names(z) <- letters[1:5]
z[c("b","c")]














