x <-1:5
y <-c(1:3,7,7)

x == 2
x != 2

x == 1 & y == 7
x == 1 | y == 7

x == 3 | y == 3
xor(x==3, y==3)
#false in all location because xor function only one of the statement can be 
#truth not all

# common errors with logicals
# = versus ==

set.seed(90)
#manually give the random number so it always run equally
#this can make so people who repeat the line of code can get the same value 
z <- runif(10) # simple integer sequence
print(z)
set.seed(90)


x<-0.5 #create logical vector
z[z<0.5] #use as index call
which(z < 0.5) # use to get indices for logical. Gives location to the values that we got 