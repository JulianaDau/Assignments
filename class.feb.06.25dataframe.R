# a data frame is a list of equal-lengthed vectors, each of which is a column

var_a <- 1:12
var_b <- rep(c("Con","LowN","HighN"),each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)
str(d_frame)

# add another row with rbind
# make sure you add a list, with each item corresponding to a column

# newData <- data.frame(list(varA=13,varB="HighN",varC=0.668),stringsAsFactors=FALSE)
new_data <- list(var_a=13,var_b="HighN",var_c=0.668)
print(new_data)
str(new_data)

d_frame <-rbind(d_frame,new_data)
str(d_frame)
tail(d_frame)

# adding another column is a little easier

#newVar <- data.frame(varD=runif(13))
new_var <- runif(13)
d_frame <- cbind(d_frame,new_var)
head(d_frame)
#must be the same lenght to match up 

# create a matrix and data frame with same structures
z_mat <- matrix(data=1:30,ncol=3,byrow=TRUE)
z_dframe <- as.data.frame(z_mat) # coerce it

str(z_mat)    # an atomic vector with 2 dimensions
str(z_dframe) # note horizontal layout of variabes!

head(z_dframe) # note automatic variable names
head(z_mat) # note identical layout

# element referencing is the same in both
z_mat[3,3]
z_dframe[3,3]
# if [,3] left empty will grab all
#z_mat[3,3]
#z_dframe[3,3]
#results in 9 if:
z_mat[,3]
z_dframe[,3]
#result will be  [1]  3  6  9 12 15 18 21 24 27 30

# so is column referencing

z_mat[,3]
z_dframe[,3]
z_dframe$V3 # note use of $ and named variable column
# and row referencing
z_mat[3,]
z_dframe[3,] # note variable names and row number shown
#result   V1 V2 V3
#       3  7  8  9

# what happens if we reference only one dimension?

z_mat[2] # takes the second element of atomic vector (column fill)
z_dframe[2] # takes second atomic vector (= column) from list
z_dframe["V2"] #interpreted as second column 
z_dframe$V2

# use complete.cases with atomic vector
zd <- runif(10)
zd[c(5,7)] <- NA
print(zd)

complete.cases(zd)
#gives locations of TRUE AND FALSES AND THE POSITION. 

zd[complete.cases(zd)] # clean them out. d in lower case. Will pull out all the NA values 

which(!complete.cases(zd)) # find NA slots which in this case was 5 and 7. Position on the atomic vector.

#to set up a matrix with missing vectors
# use with a matrix

m <- matrix(1:20,nrow=5)
m[1,1] <- NA
m[5,4] <- NA
print(m)

m[complete.cases(m),] #removed contaminated 

# now get complete cases for only certain columns!
m[complete.cases(m[,c(1,2)]),] # drops row 1. brackets specifies rows and columns . Complete case command applied for everything inside the brackets.In this case you are only interested in the first ones. See that only drop first row. 
#result 
#[,1] [,2] [,3] [,4]
#[1,]    2    7   12   17
#[2,]    3    8   13   18
#[3,]    4    9   14   19
#[4,]    5   10   15   NA
m[complete.cases(m),] 

# now get complete cases for only certain columns!
m[complete.cases(m[,c(1,2)]),] # drops row 1
m[complete.cases(m[,c(2,3)]),] # no drops
m[complete.cases(m[,c(3,4)]),] # drops row 4
m[complete.cases(m[,c(1,4)]),] # drops 1&4

# same principle applied to both dimensions of a matrix. What separator if any goes between the quotes in sep="". In the example bellow is none so leave empty.
m <- matrix(data=1:12,nrow=3)
dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)],sep=""),paste("Site",1:ncol(m),sep=""))
print(m)
#nrow(m) gives a generic aspect so doesn`t need to specify number 

m <- matrix(data=1:12,nrow=4)
dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)],sep=""),paste("Site",1:ncol(m),sep=""))
print(m)

# subsetting based on elements
m <- matrix(data=1:12,nrow=3)
dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)],sep=""),paste("Site",1:ncol(m),sep=""))
print(m)
m[1:2,3:4]
# same subsetting based on character strings (but no negative elements)
m[c("SpeciesA","SpeciesB"), c("Site3","Site4")]
# use blanks before or after comma to indicate full rows or columns
m[1:2, ]    

m[ ,3:4]

# use logicals for more complex subsetting

# e.g. select all columns for which the totals are > 15

# first try this logical
colSums(m) > 15
m[ , colSums(m) > 15]
# e.g. select all rows for which the row total is 22
m[rowSums(m)==22, ]

# note == for logical equal and != for logical NOT equal
m[rowSums(m)!=22, ]

# e.g., choose all rows for which numbers for site 1 are less than 3
# AND choose all columns for which the numbers for species A are less than 5

# first, try out this logical for rows
m[ ,"Site1"]<3
# add this in and select with all columns
m[m[ ,"Site1"]<3, ]
# and try this logical for columns
m["SpeciesA", ]<5
# add this in and select with all rows
m[ ,m["SpeciesA", ]<5]

# now combine both
m[m[ ,"Site1"]<3,m["SpeciesA", ]<5]

# and compare with full m
print(m)

#caution to not create a 1 dimensional object because R might transform it from a matrix to a vector
# caution! simple subscripting to a vector changes the data type!
z <- m[1, ]
print(z)
str(z)
#no longer has a column. Using a extra command can avoid that maintaining as a matrix. Drop function =FALSE and using z2
# to keep this as a matrix, must add the drop=FALSE option

z2 <- m[1, ,drop=FALSE]
print(z2)
str(z2)

# A few changes for working with data frames:

data <-read.csv(file="antcountydata.csv",header=TRUE,sep=",")
str(data)

