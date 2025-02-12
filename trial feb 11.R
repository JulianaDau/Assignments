
my_data <- read.table(file="Class.11.of.february_Data.csv",
                      header=TRUE,
                      sep=",",
                      comment.char="#")

# inspect object
str(my_data)

# now add a column
my_data$newVar <- runif(4)
head(my_data)


write.table(x=my_data,
            file="Class.11.of.february_Data.csv",
            sep=",")

aveRDS(my_data, file="my_data.RDS") # .RDS suffix is not required, but good for clarity