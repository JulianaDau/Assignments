#Homework5


n_dims <- sample(3:10,1)
print(n_dims)
my_vec <- seq(from=1, to=n_dims^2)
print(my_vec)
shuffled_vector <- sample(my_vec) 
print(shuffled_vector) 
m <- matrix(data=my_vec,nrow=n_dims)
print(m)
print(m)
my_matrix=matrix(data=my_vec,nrow=n_dims)
transposed_matrix <- t(my_matrix)
print(transposed_matrix)
ev <- eigen(my_matrix)
(values <- ev$values)
ev <- eigen(my_matrix)
(vectors <- ev$vectors)
typeof(ev$values)
typeof(ev$vectors)

my_matrix=matrix(runif(16),nrow=4,ncol=4)
print(my_matrix)

my_numbers <- c(1:100)
print(my_numbers)
my_logical <- sample(c(TRUE, FALSE), size = 100, replace = TRUE, prob = c(0.5, 0.5)) 
print(my_logical)

my_letters <- sample(letters, 26) 
print(my_letters)

my_list<-my_list[[2,2]]

my_list <- list(matrix(runif(16),nrow=4,ncol=4))
str(my_list)
print(my_list)
my_list [2,2]
print (my_list)

my_list <- list(matrix(runif(16),nrow=4,ncol=4))
str(my_list)
mylist <- as.list(1:16)
mylist[[2]] 
print(mylist)

my_list <- list(my_matrix <- matrix(runif(16),nrow=4), 
                my_logical <- runif(100)<0.5, 
                my_letters <- sample(x=letters, size=26))
mylist <- list(my_matrix[[2,2]], my_logical[2], my_letters[2])
print(mylist)

my_list <- list(my_matrix,
                my_logical,
                my_letters)
mylist <- typeof(list(my_matrix,
                     my_logical,
                     my_letters))
print(mylist)

vector2 <- c(my_matrix[[2,2]],my_logical[2],my_letters[2])
print(vector2)

typeof(vector2)


my_units <- runif(n=26, min=0, max=10)
my_letters <- rep(c(letters))
d_frame <- data.frame(my_units,my_letters)
print(d_frame)
str(d_frame)




