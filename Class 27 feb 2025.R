library(sqldf)
library(tidyverse)
#read in the dataset and take a look at it
species_clean<-read.csv("site_by_species.csv")
var_clean<-read.csv("site_by_variables.csv")

head(species_clean)
head(var_clean)

#start with using operations/functions on just 1 file
#g\how to subset rows
#dplyr method-using filter()

species<-filter(species_clean, Site<30)
var<-filter(var_clean, Site<30)

#SQL method for subsetting rows
query="SELECT Site, Sp1, Sp2, Sp3 FROM species WHERE Site<30"
#could switch around to reorganize columns

sqldf(query)

edit_species<-species%>%
  select(Site, Sp1, Sp2, Sp3)
edit_species_2<-species%>% #Using column #s doesn't require any indicators
  select(1, 2, 3, 4)

#SQL method-
# query entire table
query ="
SELECT *
FROM species
"
a=sqldf(query) # save results to data frame

sqldf(query) # dump to console

#specify collumns
query ="
SELECT Site, Sp1, Sp2, Sp3
FROM species
"
sqldf(query)

# reorder columns
query ="
SELECT Sp1, Sp2, Sp3, Site
FROM species
"
sqldf(query)

#If we want to rename columns, we can just use the rename() function

#Dplyr method
species<-rename(species, Long=Longitude.x., Lat=Latitude.y.)

#Pull out all the numerical columns
num_species<-species%>%
  mutate(letters=rep(letters, length.out=length(species$Site)))
num_species<-select(num_species, Site, Long, Lat, Sp1,letters)
num_species_edit<-select(num_species, where(is.numeric))

data("iris")
