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
