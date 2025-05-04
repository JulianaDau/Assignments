#ggplot 
library(ggplot2)
library(ggthemes)
library(patchwork)
#ggplot language can build by separating and linking using +. aes function stands for asthetics(1 or 2 variables) and can be called in diferents points.

#GEOM stands for geometric 

#stat which statistics might need to use 

#coordinate function can flip what is on the x to what is on the y in a rather simple way 

#files names. how it will be stored

#ggsave is necessary to make sure that is repetable 


#p1 <- ggplot(data= <DATA>) +
#  aes(<MAPPINGS>) + 
#  <GEOM_FUNCTION>(aes(<MAPPINGS>),
#                  stat=<STAT>,
#                  position=<POSITION>) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION>

#print(p1)

#ggsave(plot=p1, 
#       filename="MyPlot",
#       width=5,
#       height=3,
#       units="in",
#       device="pdf")

d <- mpg # use built in mpg data frame. mpg is a dataset to be used as an explample
str(d)
#pointing columns by name use $
table(d$fl)

#basic histogram plot 
# aes(x=hwy) it is specified which collumn wants to use
ggplot(data=d)+
  aes(x=hwy)+ 
  geom_histogram()

ggplot(data=d)+
  aes(x=hwy)+ 
  geom_histogram(fill="khaki",color="black")

#different types of GEOM
#option with a smooth curve(density plot)

ggplot(data=d)+
  aes(x=hwy)+ 
  geom_density(fill="mintcream",color="blue")

#basic scatter plot
ggplot(data=d)+
  aes(x=displ,y=hwy)+ 
  geom_point()

#to add a overlap. But it is based by proximity not really any statistical test. So not fully useful
ggplot(data=d)+
  aes(x=displ,y=hwy)+ 
  geom_point() +
  geom_smooth()

#adding linear model in red
ggplot(data=d)+
  aes(x=displ,y=hwy)+ 
  geom_point()+
geom_smooth()+
  geom_smooth(method="lm",col="red")

#basic boxpplot
ggplot(data=d) +
  aes(x=fl, y=cty) +
  geom_boxplot()

# basic boxplot (just adding a color but no information)
ggplot(data=d) +
  aes(x=fl, y=cty) +
  geom_boxplot(fill="thistle")

#basic barplot(long format)
ggplot(data=d)+
  aes(fl)+
  geom_bar(fill="thistle", color="black")

# bar plot with specified counts or meansw. Making a smaller data set named summary data
x_treatment <- c("Control","Low","High")
y_response <- c(12,2.5,22.9)
summary_data <- data.frame(x_treatment,y_response)

#geom column distinction by how it is constructed compared to geom bar
#control in grey and the changed groups in golden. this way of using color iss better because carries a reasoning to use it
ggplot(data=summary_data) +
  aes(x=x_treatment,y=y_response) +
  geom_col(fill=c("grey50","goldenrod","goldenrod"),col="black")

# basic curves and functions
#sequence of 1 to 100 with distance of 0.1 giving 1000 points
my_vec <- seq(1,100,by=0.1)

# plot simple mathematical functions
d_frame <- data.frame(x=my_vec,y=sin(my_vec))
ggplot(data=d_frame) +
  aes(x=x,y=y) +
  geom_line()

#plot probability functions. Normal distribution bound by zero so only show data above zero
d_frame <- data.frame(x=my_vec,y=dgamma(my_vec,shape=5, scale=3))
ggplot(data=d_frame) +
  aes(x=x,y=y) +
  geom_line()

# plot user-defined functions
my_fun <- function(x) sin(x) + 0.1*x
d_frame <- data.frame(x=my_vec,y=my_fun(my_vec))
ggplot(data=d_frame) +
  aes(x=x,y=y) +
  geom_line()

#Those were all in default. So to change will be the next set of commands and how it looks (example how your axis is organized)
#Themes and fonts
p1 <- ggplot(data=d)+
  (mapping=aes(x=displ,y=cty)) + 
  geom_point()
print(p1)

#change overall background color
p1 + theme_classic() # no grid lines

p1 + theme_linedraw() # black frame

p1 + theme_dark() # good for brightly colored points

p1 + theme_base() # mimics base R

p1 + theme_par() # matches current par settings in base

p1 + theme_void() #shows only data. the background is transparent

p1 + theme_solarized() # good for web pages

p1 + theme_economist() # many specialized themes

p1 + theme_grey() # ggplots default theme. Is the one you get when you don`t specify
`
## Class April 1
#ggplot 
library(ggplot2)
library(ggthemes)
library(patchwork)


d <- mpg # use built in mpg data frame. mpg is a dataset to be used as an explample
str(d)
#pointing columns by name use $
table(d$fl)
p1 <- ggplot(data=d)+
  (mapping=aes(x=displ,y=cty)) + 
  geom_point()
print(p1)
 
# use theme parameters to modify font and font size
p1 + theme_classic(base_size=30,base_family="serif")

# defaults: theme_grey, base_size=16,base_family="Helvetica")
# font families (Mac): Times, Ariel, Monaco, Courier, Helvetica, serif,sans



# code for adding additional fonts
library(extrafont)
font_import()  # Imports all system fonts (run once)

y
fonts()

p1 + theme_classic(base_size=35,
                   base_family="sans")
# use coordinate_flip to invert entire plot
p2 <- ggplot(data=d, mapping=aes(x=fl,fill=fl)) + geom_bar()
print(p2)
p2 + coord_flip() + theme_grey(base_size=20,base_family="sans")


# use labs for different plot labels
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point() +
  labs(title="My graph title here",
       subtitle="An extended subtitle",
       x="Displacement",
       y="City Mileage",
       caption="Add a caption here") +
  theme_bw(base_size=25,base_family="Monaco")
#    xlim(0,4) + ylim(0,20)
print(p1)

# use attributes for point size shape, color
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=21,
             color="black",fill="cyan") +
  theme_bw(base_size=25,base_family="serif")
print(p1)
# using a different shape (this has a code 24 and is a triangle)
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=24,
             color="black",fill="purple") +
  theme_bw(base_size=25,base_family="serif")
print(p1)

#changing limits and clip dataset
# use x and/or y limits to clip data set
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=21,
             color="black",fill="cyan") +
  xlim(4,7) + 
  ylim(-10,40) +
  theme_bw(base_size=25,base_family="Monaco")
print(p1)

#
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=21,
             color="black",fill="cyan") +
  xlim(4,7) + 
  ylim(0,20) +
  theme_bw(base_size=25,base_family="serif")
print(p1)

###


