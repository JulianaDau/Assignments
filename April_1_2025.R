#April 1 2025
#ggplot 
library(ggplot2)
library(ggthemes)
library(patchwork)
#patchwork enable to make one picture with multiple plots

d <- mpg # use built in mpg data frame. mpg is a dataset to be used as an explample
str(d)
#pointing columns by name use $
table(d$fl)

g1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point() + 
  geom_smooth()
print(g1)

g2 <- ggplot(data=d) +
  aes(x=fl) +
  geom_bar(fill="tomato",color="black")+ 
  theme(legend.position="none")
print(g2)

g3 <- ggplot(data=d) +
  aes(x=displ) + 
  geom_histogram(fill="royalblue",
                 color="black")
print(g3)

g4 <- ggplot(data=d) +
  aes(x=fl,y=cty,fill=fl) + 
  geom_boxplot() + 
  theme(legend.position="none")

print(g4)
# place two plots horizontally
g1 + g2

# with 3 
g1 + g2 + g3

# place 3 plots vertically
g1 + g2 + g3 + plot_layout(ncol=1)

# change relative area of each plot
g1 + g2 + plot_layout(ncol=1,heights=c(2,1))

g1 + g2 + plot_layout(ncol=1,heights=c(1,2))

g1 + g2 + plot_layout(ncol=2,widths=c(1,2))

# add a spacer plot 
g1 + plot_spacer() + g2


# use nested layouts
g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol=1)
  }
} +
  plot_layout(ncol=1)

# - operator for subtrack placement. Will put g3 bellow
g1 + g2 - g3 + plot_layout(ncol=1)

# in this case puts g2 bellow the other graphs 
g1 + g3 - g2 + plot_layout(ncol=1)

# / and | for intuitive layouts
(g1 | g2 | g3)/g4

#playing around

g4/(g1 | g2 | g3)

(g1 | g2)/(g3 | g4)

# Add title, etc. to a patchwork
g1 + g2 + plot_annotation('This is a title', 
                          caption = 'made with patchwork')
# Change styling of patchwork elements
g1 + g2 +
  plot_annotation(
    title = 'This is a title',
    caption = 'made with patchwork',
    theme = theme(plot.title = element_text(size = 16))
  )

# Add tags to plots
g1 / (g2 | g3) +
  plot_annotation(tag_levels = 'A')

#to later print the image 
g4<- g1 / (g2 | g3) +
  plot_annotation(tag_levels = 'A')

#also works for numbering. so instead of A could add 1 and will follow the numbering 

#Swapping axis orientation for multipanel plot
g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse() 
g3c <- g3 + scale_x_reverse() + scale_y_reverse()

(g3 | g3a)/(g3b | g3c)

(g3 + coord_flip() | g3a + coord_flip())/(g3b + coord_flip() | g3c + coord_flip())

ggsave(filename="MyPlot2.pdf",plot=g4, device="pdf",width=20,height=20,units="cm",dpi=300)

# mapping of a discrete variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=class) +
  geom_point(size=3) 
print(m1)
# can use shape for it 
mshape <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,shape=class) +
  geom_point(size=3) 
print(mshape)

(m1 | mshape) 

# mapping of a discrete variable to point shape (<= 6)

## Warning: The shape palette can deal with a maximum of
## 6 discrete values because more than 6
## becomes difficult to discriminate; you have
## 7. Consider specifying shapes manually if
## you must have them.

# mapping of a discrete variable to point size (not advised)
m1 <- ggplot(data=mpg) +          
      aes(x=displ,y=cty,size=class) + 
      geom_point() 
print(m1)


#Using size for a discrete variable is not advised. 

# mapping a continuous variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=hwy) + 
  geom_point(size=5) 
print(m1)

# mapping two variables to different aesthetics
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,shape=class,color=hwy) + 
  geom_point(size=5) 
print(m1)


# use shape for smaller number of categories
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,shape=drv,color=fl) +  
  geom_point(size=5)  
# use all 3 (size, shape, color) to indicate 5 attributes!
m1 <- ggplot(data=mpg) +
  aes(x=displ,
      y=cty,shape=drv,
      color=fl,
      size=hwy) + 
  geom_point()
print(m1)


# mapping a variable to the same aesthetic in two different geoms
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=drv) + 
  geom_point(size=2) +
  geom_smooth(method="lm")
print(m1)

#Faceting variables for more effective groupings ###
# basic faceting with variables split by row, column, or both
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty) + 
  geom_point() 

#x still displacement . if only the first would be a simple scatter plot. But now separate by classes per fuel type  (bellow)
m1 +  facet_grid(class~fl)    

# when making changes on the Y axis to change how visualize. In this case the scale is not kept the same and varies depending of where the points fall. 
m1 + facet_grid(class~fl, scales="free_y")
# same but making free the x and the y
m1 + facet_grid(class~fl, scales="free")

#shifted direction and variable of focus. Removed fuel type
m1 + facet_grid(.~class)

m1 + facet_grid(class~.)

# use facet wrap when variables are not crossed
m1 + facet_grid(.~class)


m1 +  facet_wrap(~class)  

m1 + facet_wrap(~class + fl)


m1 + facet_wrap(~class + fl, drop=FALSE)

#show 4 variables
m1 + facet_grid(class~fl)

# use facet with other aesthetic mapping within rows or columns
# see that in this case added color  --> aes(x=displ,y=cty,color=drv)
m1 <- ggplot(data=mpg) +                                         
  aes(x=displ,y=cty,color=drv) + 
  geom_point() 

m1 + facet_grid(.~class)

# easy to switch to other geoms. Not plotting the points individually just as smooth. removed error bar by adding se=FALSE
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,color=drv) + 
  geom_smooth(se=FALSE,method="lm") 

m1 + facet_grid(.~class)

# fitting with boxplots over a continuous variable. X variable is the displacement.
m1 <- ggplot(data=mpg) +  
  aes(x=displ,y=cty) + 
  geom_boxplot()

m1 + facet_grid(.~class)

# add a group and fill mapping for subgroups
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,group=drv,fill=drv) + 
  geom_boxplot()

m1 + facet_grid(.~class)

# standard plot with all data
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point() + 
  geom_smooth()
print(p1)

#grouping command 
# break out the drive types (note what group affects
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy, group=drv) +
  geom_point() + 
  geom_smooth()
print(p1)
#but still not clear because missing coloring to be able to tell apart 

# break out the drive types (note what color affects) Color grouping
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy, color=drv) +
  geom_point() + geom_smooth()
print(p1)

# break out the drive types (note what fill affects). Color confidence spcacr, lines have same colorand dots are not colored 
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy, fill=drv) +
  geom_point() + geom_smooth()
print(p1)

# use both if you want points, lines, and confidence intervals colored
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy, color=drv, fill=drv) +
  geom_point() + geom_smooth()
print(p1)

# now use aesthetic mappings within each geom to over-ride defaults
# subset the data frame to pull out what you need
#added statement about the data to include only 4 wheel as the dots that appear


p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy,col=drv) +
  geom_point(data=d[d$drv=="4",]) + geom_smooth()
print(p1)

# instead of subsetting, just map an aesthetic. See only one smoother fitting all of the data 
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + geom_smooth()
print(p1)

# Conversely, map the smoother, but not the points
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point() + geom_smooth(aes(color=drv))
print(p1)

# also, subset in the first layer to eliminate some data entirely
# instead of subsetting, just map an aesthetic. Removing the points of 4 wheel drive instead to what was done in another example 
p1 <- ggplot(data=d[d$drv!="4",]) + 
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + geom_smooth()
print(p1)

###lecture III 
devtools::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
devtools::install_github("clauswilke/colorblindr")
