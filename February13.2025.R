#class feb13
#control structures
#ways to use your code 
#simple inequalities 
5>3
5<3
5>=5
5<=5
5==3
5!=3
FALSE&FALSE
FALSE&TRUE
TRUE&TRUE

# use & for AND
FALSE & FALSE
FALSE & TRUE
TRUE & TRUE
5 > 3 & 1!=2
1==2 & 1!=2

# use | for OR
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE
1==2 | 1!=2

# works with vectors

1:5 > 3

#if vectors are same length:
a <- 1:10
b <- 10:1
a > 4 & b > 4


# xor for exclusive or testing of vectors. More exclusive that the or statement
# works for (TRUE FALSE) but not (FALSE FALSE) or (TRUE TRUE)
xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
xor(a,b)

# compare with a | b
# works for (TRUE FALSE) or (TRUE TRUE)
a | b

#new boolean operators
# boolean algebra on sets of atomic vectors (logical,numeric, character strings)

a <- 1:7
b <- 5:10
# union to get all elements. But note that it is different from c(a,b) that keeps the duplicates while union gets rid of it. But could also use unique to have the same result as union in this case.
union(a,b)
c(a,b)
unique(c(a,b))

# intersect to get common elements
intersect(a,b)

# setdiff to get distinct elements in a
setdiff(a,b)

setdiff(b,a) #gives unique to b vector
# setequal to check for identical elements
setequal(a,b)

# more generally, to compare any two objects
z <- matrix(1:12,nrow=4,byrow=TRUE)
z1 <- matrix(1:12,nrow=4,byrow=FALSE)

# This just compares element by element
z==z1
# Use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)
# most useful for if statements is %in% or is.element
# these two are equivalent, but I prefer the %in% for readability
d <- 12
d %in% union(a,b)
is.element(d,union(a,b)) #gives similar response that the last one d %in% union(a,b)

# check for partial matching with vector comparisons

d <- c(10,12)
d %in% union(a,b)
d %in% a

if (condition) {expression1}

if (condition) {expression1} else {expression2}

if (condition1) {expression1} else
  if (condition2) {expression2} else
#if condition is true the order will be executated. can include as condition a function to make a more straightfoward line of code)
    