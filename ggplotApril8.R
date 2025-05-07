##ggplot graph types from R graph Gallery 
#April 8
library(ggplot2)
library(ggridges) # ridge plots
library(ggbeeswarm) # beeswarm plots
library(GGally) # parallel coordinates plots
library(ggpie) # pie charts
library(ggmosaic) # mosaic plots
library(scatterpie) # scatter pies on map
library(waffle) # for waffle plots
library(DescTools) # for converting table to long
library(treemap) # for tree maps

d <- mpg
# violin plot ----
#shows the shape of all the data
# symmetric density plot. Shows all data but has also the shape 
p1 <- ggplot(data=d) +
  aes(x=drv, y=cty, fill=drv) + 
  geom_violin() +
  geom_point(position=position_jitter(width=0.2,
                                      height=0.3),color="black",size=0.4)
p1

# ridgeline plot ----
#could be time series data 
p2 <- ggplot(data=d) +
  aes(x=cty,y=drv,fill=drv) + 
  ggridges::geom_density_ridges() +
  ggridges::theme_ridges() 
p2  

# beeswarm plot ----
p3 <- ggplot(data=d) +
  aes(x=drv,y=cty,color=drv) + 
  ggbeeswarm::geom_beeswarm(method = "center",size=2) 
p3


# bubble plot ----
# variation on a scatter plot but can also change size of circle, having 3 variables.In this specific example has 4 (the fourth is fill). X and Y are the continuous variable. Has size=cty and fill=drv.
p4 <- ggplot(data=d) +
  aes(x=displ,y=hwy,size=cty,fill=drv) +
  geom_point(shape=21,color="black",stroke=0.5)
p4



# parallel coordinates plot ----
#might be useful for temporal data 
#The way that is written is good to have name of the package which maker easier for people to reproduce the coding 
p5 <- GGally::ggparcoord(data=d,
                         columns = c(3,9), # c(3,5,8,9) 
                         groupColumn = 7) 
p5

# lollipop plot ----
#d is data frame and fl the counts inside the variable fuel. 
table(d$fl)

fuel_data <- data.frame(
  table(d$fl),
  fuel=c("Natural Gas",
         "Diesel",
         "Ethanol",
         "Premium",
         "Regular"))
fuel_data <- fuel_data[,-1] # remove tabled column
fuel_data$Freq <- fuel_data$Freq+100

p6<- ggplot(data=fuel_data) +
  aes(x=fuel, y=Freq) +
  geom_segment(aes(x=fuel, 
                   xend=fuel, y=0, 
                   yend=Freq), 
               color="grey",
               linewidth=2) +
  geom_point( color="orange", size=7) +
  labs(title="Fuel Type",
       x="", #doesn`t want anything on the x axis that is why empty`
       y="Count") +
  coord_flip() + #this is important or else the way the graph looks is different and less clear than on its side 
  theme_light(base_size=20,base_family=
                "Monaco") +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title.position = "plot",  
    plot.title = element_text(hjust = 0))  
p6

# typical unsatisfactory pie chart ----

p7 <- ggpie::ggpie(data=mpg,
                   group_key="class",
                   count_type="full",
                   label_info="ratio", 
                   label_type="none") # try circle to show percentages 
p7

p7 <- ggpie::ggpie(data=mpg,
                   group_key="class",
                   count_type="full",
                   label_info="ratio", 
                   label_type="circle") # try circle
p7

# waffle plot ----
#can be better than the pie for visualization
tabled_data <- as.data.frame(table(class=mpg$class))
#need to use the as.data.frame
p8 <- ggplot(data=tabled_data) +
  aes(fill = class, values = Freq) +
  waffle::geom_waffle(n_rows = 8, size = 0.33, colour = "white") +  #color is the color in between the squares
  coord_equal() +
  theme_void()
p8

#default color - might have problems not having options that are perceived as so different (hue,brightness, saturation)

# Scatterpie ----
#highly effective scatterpie diagrams
#note that ideally shouldn`t have more than 3 groups `
d <- data.frame(x=rnorm(5), y=rnorm(5))
d$A <- abs(rnorm(5, sd=1))
d$B <- abs(rnorm(5, sd=2))
d$C <- abs(rnorm(5, sd=3))
#a,b and c will represent the size proportionally/relative. 

p9 <- ggplot(data=d) + 
  scatterpie::geom_scatterpie(
    aes(x=x, y=y), 
    pie_scale=4,
    cols=c("A", "B","C")) + #cols is the colunms 
  coord_fixed() +
scale_fill_manual(values=c("coral","grey95","grey90")) # with this color give evidence to one group. If removed this line of scale_fill_manual would have standard colors from R. But using makes it possible to choose the colors. 
p9
#Scatter pies can be more helpfull than just a regular pie


#Mosaic plots ----
# mosaic plots for proportional data (1 or 2 factors). All combinations of factors must be present!
# no zero values

# Simple 1-factor partition
# options hspine (default),vspine,vbar,hbar
city_tree <- expand.grid(Tree=c("Oak","Pine","Maple","Spruce","Beech"),City=c("Bur","Col","Win")) #sets columns on the dataframe 

#city_tree is a new variable 
city_tree$Freq <- c(100,2,25,
                    9,4,7,
                    3,30,30,
                    2,2,5,
                    6,6,6)
city_tree_long <- DescTools::Untable(city_tree)
d <- city_tree_long
head(d)
nrow(d) #to now the number 
p10 <- ggplot(data = d) +
  geom_mosaic(aes(x = product(Tree), 
                  fill=Tree),
              divider="hspine") + 
  labs(title='Tree Type')
p10

# 2-factor partition
#listing tree and city
# divider options mosaic("h"),mosaic("v"),ddecker()
d <- city_tree_long

p11 <- ggplot(data = d) +
  geom_mosaic(aes(x = product(Tree,City), 
                  fill=Tree),
              divider=mosaic("v")) + #v for vertical partition 
  labs(title='mosaic v')
p11
#
d <- city_tree_long

p12 <- ggplot(data = d) +
  geom_mosaic(aes(x = product(Tree,City), 
                  fill=Tree),
              divider=mosaic("h")) + #h for horizontal partition 
  labs(title='mosaic h')
p12

# 2 factor with conditioning
p13 <- ggplot(data = d) +
  geom_mosaic(aes(x=product(Tree), fill = Tree, 
                  conds = product(City))) + #conditioning in the city so width is the same
  labs(title='f(Tree | City)')
p13

# alternative to conditioning: faceting
p14 <- ggplot(data = d) +
  geom_mosaic(aes(x = product(Tree), fill=Tree), divider = "vspine") +
  labs(title='f(Tree | City)') + 
  facet_grid(~City) +
  theme(aspect.ratio = 3,
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())
p14

# tree map for hierarchical frequency data ----

# in contrast to mosaic, this can accomodate missing data

# simple one dimensional example (from mpg)

d <- as.data.frame(table(Fuel=mpg$fl,Drive=mpg$drv))
d$Fuel <- rep(c("Compressed Gas",
                "Diesel",
                "Ethanol",
                "Premium",
                "Regular"),3)
d$Drive <- rep(c("Four Wheel",
                 "Front Wheel",
                 "Rear Wheel"),each=5)
treemap(dtf=d,
        index="Fuel",
        vSize="Freq",
        type="index")  
#needs to specify the dataframe=dtf
#treemap is able to accomodate groups that have 0

# now 2d with subgroups

treemap(dtf=d,
        index=c("Fuel","Drive"),
        vSize="Freq",
        type="index")
#show proportion of categories. has subgroups 

#now puting drive first will show only show 3 group color (drive and inside will be fuel )
treemap(dtf=d,
        index=c("Drive","Fuel"),
        vSize="Freq",
        type="index")  
