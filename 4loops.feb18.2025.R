#loops 
#18 february 

# for (var in seq) { # start of for loop
  
  # body of for loop 
  
# } # end of for loop

#var needs to be given a name also to specify a sequence. needs to be a sequence, can even be negative but needs to hav a sequence 
# remember control+shift+ c to turn a function to # text in front. 

for (i in 1:5) {
  cat("stuck in a loop","\n")
  cat(3 + 2,"\n")
  cat(runif(1),"\n")
}

# in this case will loop 5 times and i will change 
print (i)
#variable is in global environment 

my_dogs <- c("chow","akita","malamute","husky","samoyed")
for (i in 1:length(my_dogs)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}
#specify i itself as a variable 
my_bad_dogs <- NULL
for (i in 1:length(my_bad_dogs)){
  cat("i =",i,"my_bad_dogs[i] =" ,my_bad_dogs[i],"\n")
}
for (i in seq_along(my_dogs)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}
# This time we correctly skip my_bad_dogs and do not make the loop
for (i in seq_along(my_bad_dogs)){
  cat("i =",i,"my_bad_dogs[i] =" ,my_bad_dogs[i],"\n")
}
zz <- 5
for (i in seq_len(zz)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}


