#working with functions and creacting user-defined functions 
#11 February 2025
#3 pieces of a function 
sum(3,2) # a "prefix" function
3 + 2 # an "operator", but it is actually a function
`+`(3,2) # the operator is an "infix" function

y <- 3
print(y)
`<-`(yy,3) # another "infix" function
print(yy)
print(read.table)

sd #shows the code
sd # shows the code
sd(c(3,2)) # call the function with parameters
sd() # call function with default values for parameters. in this case sd only doesn`t work because no default value is given. Some parameters have defaults and others don`t. 

functionName <- function(parX=defaultX,parY=defaultY,parZ=defaultZ) { 
  
  # curly bracket open marks the start of the function body
  
  # Body of the function goes here
  # Lines of R code and annotations
  # May also call functions
  # May also create functions
  # May also create local variables
  
  return(z)  # returns from the function a single element (z could be a list)
  
  # curly bracket close marks the end of the function body
} 

# prints the function body
functionName 

# calls the function with default values and returns object z
functionName() 

# calls the function with user-specified values for each paramater. parY single character string and parZ
functionName(parX=myMatrix,parY="Order",parZ=c(0.3,1.6,2,6))

##################################################
# FUNCTION: HardyWeinberg
# input: an allele frequency p (0,1). value between 0 and 1. p runif 1 to be used as default if not given a value by the user
# output: p and the frequencies of the 3 genotypes AA, AB, BB
#------------------------------------------------- 
HardyWeinberg <- function(p=runif(1)) {
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)
  return(vecOut)
}
##################################################
HardyWeinberg()  #give the genotype p value
#difference local vs global environment. The q <- 1 - p
#fAA <- p^2
#fAB <- 2*p*q
#fBB <- q^2
#vecOut <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)
#return(vecOut) is only locally 
HardyWeinberg(p=0.5) # pass to the parameter the value p
# print(p) # error because p does not exist in the global environment
pp <- 0.6 # variable pp is stored in global environment
HardyWeinberg(p=pp) # pass contents of variable pp to function parameter p
print(pp) # variable pp is still stored in memory

##################################################
# FUNCTION: HardyWeinberg2
# input: an allele frequency p (0,1)
# output: p and the frequencies of the 3 genotypes AA, AB, BB
#------------------------------------------------- 
HardyWeinberg2<- function(p=runif(1)) {
  if (p > 1.0 | p < 0.0) {
    return("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)
  return(vecOut)
}
##################################################
HardyWeinberg2()
HardyWeinberg2(1.1) # OK, print error to screen
z <- HardyWeinberg2(1.1) # uggh no error printed
print(z) # Error message was saved to variable z!

#global variables: visible to all parts of the code; declared in main body
#local variables: visible only within function; declared in function or passed to function through parameters
#functions “can” see variables in global environment
#global environment cannot see variables in function environment

#added new variable z that is only inside the function 
my_func <- function(a=3,b=4) {
  z <- a + b
  return(z)
}
my_func()

my_func_bad <-function(a=3) {
  z <- a + b
  return(z)
}
#although there is a error a error doesn`t appear because the syntax might be correct but not the local/global localization 
my_func_bad() # crashes because it can't find b`

b <- 100
my_func_bad() # OK now because b exists as a global variable

#to correct do like bellow 
# But it is fine to create variables locally. bb only inside function 
my_func_ok <- function(a=3) {
  bb <- 100
  z <- a + bb
  return(z)
}

my_func_ok() # no problems now
print(bb) # but this variable is still hidden from the global environment. exists only inside the function 
print(a)
print(z)
# a and z same case not found globally

##################################################
# FUNCTION: fit_linear 
#my_mod indicates model which in this case is linear 
# fits simple regression line
# inputs: numeric vector of predictor (x) and response (y)
# outputs: slope and p-value
#------------------------------------------------- 
fit_linear <- function(x=runif(20),y=runif(20)) {
  my_mod <- lm(y~x) # fit the model
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
              p_value=summary(my_mod)$coefficients[2,4])
  plot(x=x,y=y) # quick and dirty plot to check output
  return(my_out)
}
##################################################
fit_linear()
#didn`t assign output so it just show. Vector myout gives slope and p_value also gives dirty plot`

#creating more complex default values 
##################################################
# FUNCTION: fit_linear2    
#gave single parameter of p
#if give true or false action 
# fits simple regression line
# inputs: numeric vector of predictor (x) and response (y)
# outputs: slope and p-value
#------------------------------------------------- 
fit_linear2 <- function(p=NULL) {
  if(is.null(p)) {
    p <- list(x=runif(20),y=runif(20))
  }
  my_mod <- lm(p$x~p$y) # fit the model
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
              p_value=summary(my_mod)$coefficients[2,4])
  plot(x=p$x,y=p$y) # quick and dirty plot to check output
  return(my_out)
}

##################################################

fit_linear2()
my_pars <-list(x=1:10,y=sort(runif(10)))
#in this limit to 10 points while the other function pull 20. Also put in numerical order even though random number generated 
fit_linear2(p=my_pars)
#this is useful to see if the code is working well before using the final dataset

z <- c(runif(99),NA) #has 99 random numbers followed by 1 NA
mean(z) # oops, mean doesn't work if there is an NA. Doesn`t give a error, just an NA. Because no answer can be given in this slot `
mean(x=z,na.rm=TRUE) # change the default value for na.rm. (na.rm function remove the NA, normally default is FALSE but by giving the order and turning it TRUE will remove), You are able to discover that FALSE is the default by looking on the help tab the function and under the usage will indicate FALSE. 
mean(x=z,na.rm=TRUE,trim=0.05) # check out the "trim" option in help. Trim 0.5 will remove 5% outliers. 
l <- list(x=z,na.rm=TRUE,trim=0.05) # bundle paramaters as a list
do.call(mean,l) # use the do.call function with the function name and the parameter list (which will have the specified values)
