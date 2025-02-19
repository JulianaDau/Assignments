z <- signif(runif(1),digits=2)
print(z)
z > 0.5
if (z > 0.5) cat(z, "is a bigger than average number","\n")
if (z > 0.8) cat(z,"is a large number","\n") else 
  if (z < 0.2) cat(z,"is a small number","\n") else
  {cat(z,"is a number of typical size","\n")
    cat("z^2 =",z^2,"\n")}

# if statement requires a single logical value. With a vector,
# it will assign TRUE/FALSE based on very first element only.

z <- 1:10

# this does not do anything
if (z > 7) print(z)

# probably not what you want. before was possible in r but now doesn`t really work regardless`
if (z < 7) print(z)

# use subsetting!best option to use
print(z[z < 7])

#Suppose we have an insect population in which each female lays, on average, 10.2 eggs, following a Poisson distribution with λ=10.2
#However, there is a 35% chance of parasitism, in which case no eggs are laid. Here is the distribution of eggs laid for 1000 individuals:
tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=3.2),0)
hist(eggs)
# see that poison distribution. But why so many zeros. It is the combination of parasitism and individuals that were not but nonetheless had 0 laid eggs. 
pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"lowerTail","nonSig")
z[pVals>=0.975] <- "upperTail"
table(z)
