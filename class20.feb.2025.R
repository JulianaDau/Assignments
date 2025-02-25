# create a simple random growth population model function

##################################################
# FUNCTION: ran_walk
# stochastic random walk 
# input: times = number of time steps
#        n1 = initial population size (= n[1])
#        lambda = finite rate of increase
#        noise_sd = sd of a normal distribution with mean 0
# output: vector n with population sizes > 0 
#         until extinction, then NA 
#------------------------------------------------- 
# lambda=1.0 no change
# lambda=1.1 10% increase each time step
# lambda=0.98 2% decrease each time step 
# times= indicate step size

library(ggplot2)
ran_walk <- function(times=100,n1=50,lambda=1.00,noise_sd=10) {
  n <- rep(NA,times)  # create output vector
  n[1] <- n1 # initialize with starting population size
  noise <- rnorm(n=times,mean=0,sd=noise_sd) # create noise vector
  for(i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i] #i counter element 
    if(n[i + 1] <=0) {
      n[i + 1] <- NA
      cat("Population extinction at time",i+1,"\n")
      break}
  }
  
  return(n)
}
ran_walk() #make possible so you can see the values. NA generated is less than what was generated. It can`t go further than 100 because of how it was setup.
#this case needs to use for loop
# explore paramaters in plot function. x will go from 1 to 100 and y is whatever we get in the ran_walk. Get random sequence as we have it. Line trace just as much as the population goes. which the max will be 100 but might end earlier depending of the NA 
qplot(x=1:100,y=ran_walk(),geom="line")

qplot(x=1:100,y=ran_walk(noise_sd=0),geom="line") #noise to 0 shuts the noise off to see deterministic. SHould show as a line, no up or down, this is a test to check that the code is correct

qplot(x=1:100,y=ran_walk(lambda=1.1,noise_sd=0),geom="line")

qplot(x=1:100,y=ran_walk(lambda=0.92,noise_sd=0),geom="line")

qplot(x=1:100,y=ran_walk(),geom="line")
qplot(x=1:100,y=rnorm(n=100,mean=50),geom="line")



m <- matrix(round(runif(20),digits=2),nrow=5)
# loop over rows
for (i in 1:nrow(m)) { # could use for (i in seq_len(nrow(m)))
  m[i,] <- m[i,] + i #loop gone one row at a time to make the calculation 
} 
print(m)

# Loop over columns
m <- matrix(round(runif(20),digits=2),nrow=5)
for (j in 1:ncol(m)) {
  m[,j] <- m[,j] + j
}
print(m)

# Loop over rows and columns
m <- matrix(round(runif(20),digits=2),nrow=5)
for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    m[i,j] <- m[i,j] + i + j
  } # end of column j loop
} # end or row i loop
print(m) 
 #add column number and row number 

# S = cA^z species area function, but what does it look like??

##################################################
# function: SpeciesAreaCurve
#number of species in a island. in function of area
# creates power function relationship for S and A
# input: A is a vector of island areas
#        c is the intercept constant
#        z is the slope constant
# output: S is a vector of species richness values
#------------------------------------------------- 
species_area_curve <- function(A=1:5000,c= 0.5,z=0.26){
  
  S <- c*(A^z)
  return(S)
}
head(species_area_curve())

# second function to generate graph 
##################################################
# function: species_area_plot
# plot species area curves with parameter values
# input: A = vector of areas
#        c = single value for c parameter
#        z = single value for z parameter

# output: smoothed curve with parameters in graph
#------------------------------------------------- 
species_area_plot <- function(A=1:5000,c= 0.5,z=0.26) {
  plot(x=A,y=species_area_curve(A,c,z),type="l",xlab="Island Area",ylab="S",ylim=c(0,2500)) #l stand for line plot, ylab stand to how the y axis will be named 
  mtext(paste("c =", c,"  z =",z),cex=0.7) #mtext  is margin text 
  #      return()
}
species_area_plot()

# global variables
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
par(mfrow=c(3,4))
for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i],z=z_pars[j])
  }
} 
# enables to see how the model will look under differnt conditions of c and z. Made 12 passes that match the 12 plots.
