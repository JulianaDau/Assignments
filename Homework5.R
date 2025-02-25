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

