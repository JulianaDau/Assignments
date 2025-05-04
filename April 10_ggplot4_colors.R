#Colors 
devtools::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
devtools::install_github("clauswilke/colorblindr")

library(ggplot2)
library(ggthemes)
library(colorblindr)
library(colorspace)
library(wesanderson)
library(ggsci)

#https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3
d <- mpg
#demoplot to test palettes ----
#demoplot needs to give the color to check if the plot colors looks good next to each other. can run with anything to test the palette. Can check as map or other formats 
my_cols <- c("thistle","tomato","cornsilk","cyan","chocolate")
demoplot(my_cols,"map")
demoplot(my_cols,"bar")
demoplot(my_cols,"scatter")
demoplot(my_cols,"heatmap")
demoplot(my_cols,"spine")
demoplot(my_cols,"perspective")

#Working with black and white ----
# gray function versus gray colors

# built in greys (0 = black, 100 = white
my_greys <- c("grey20","grey50","grey80")
demoplot(my_greys,"bar")

my_greys2 <- grey(seq(from=0.1,to=0.9,length.out=10)) #instead of using naming but using a sequence of 10 colors in a grey scale         
demoplot(my_greys2,"heatmap")

# converting color plots to black and white ----
p1 <- ggplot(d,aes(x=as.factor(cyl),y=cty,fill=as.factor(cyl))) + geom_boxplot() 
plot(p1)

# default colors look identical in black white
p1_des<- colorblindr::edit_colors(p1, desaturate)
plot(p1_des)
#colors didn`t convert well.

# custom colors not pretty, but convert ok to bw
p2 <- p1 + scale_fill_manual(values=c("red","blue","green","yellow"))
plot(p2)
p2_des<- colorblindr::edit_colors(p2, desaturate)
plot(p2_des) #separate better than before because as difference in saturation and brightness

#using alpha transparency for histograms ----
x1 <- rnorm(n=100,mean=0)
x2 <- rnorm(n=100,mean=2.7)
d_frame <- data.frame(v1=c(x1,x2)) #strung 2 together 
lab <- rep(c("Control","Treatment"),each=100)
d_frame <- cbind(d_frame,lab)
str(d_frame)

h1 <- ggplot(d_frame) +
  aes(x=v1,fill=lab)
h1 + geom_histogram(position="identity",alpha=0.5,color="black")  #alpha is the transparency 

#color customization----
d <- mpg
# --------- discrete classification
# scale_fill_manual for boxplots,bars
# scale_color_manual for points, lines

# boxplot no color
p_fil <- ggplot(d) +
  aes(x=as.factor(cyl),y=cty)
p_fil + geom_boxplot()

# boxplot default ggplot fill
p_fil <- ggplot(d) +
  aes(x=as.factor(cyl),y=cty,fill=as.factor(cyl)) + 
  geom_boxplot()
plot(p_fil)

# create custom color palette (named my_cols in this case)
my_cols <- c("red","brown","blue","orange")

# boxplot with custom colors for fill
p_fil + scale_fill_manual(values=my_cols)

# scatterplot with no color
p_col <- ggplot(d) +
  aes(x=displ,y=cty)
p_col + geom_point(size=3)

# scatterplot default ggplot colors
p_col <- ggplot(d) +
  aes(x=displ,y=cty,col=as.factor(cyl)) + 
  geom_point(size=3)
plot(p_col)

# scatterplot with custom colors for point color
p_col + scale_color_manual(values=my_cols)

# ------- continuous classification (color gradient)

# default color gradient
p_grad <- ggplot(d) + 
  aes(x=displ,y=cty,col=hwy) + 
  geom_point(size=3)
plot(p_grad)

# custom sequential gradient (2-colors)----
#Can change to the desired color to be the low or high
p_grad + scale_color_gradient(low="green", high="red")

# custom diverging gradient (3-colors)
mid <- median(d$cty)
p_grad + scale_color_gradient2(midpoint=mid,
                               low="blue",
                               mid="white",
                               high="red")

# custom diverging gradient (n-colors
p_grad + scale_color_gradientn(colors=c("blue","green","yellow","purple","orange"))

library(wesanderson)
print(wes_palettes)
#with print can see all the listed ones included on this library 
demoplot(wes_palettes$BottleRocket1,"pie")
demoplot(wes_palettes$GrandBudapest1,"pie")
demoplot(wes_palettes$GrandBudapest2,"pie")
#again can use the demoplot to test
demoplot(wes_palettes[[2]][1:3],"bar")

my_cols <- wes_palettes$GrandBudapest2[1:4]
p_fil + scale_fill_manual(values=my_cols)

#Color brewer----
library(RColorBrewer)
display.brewer.all()
display.brewer.all(colorblindFriendly=TRUE)

demoplot(brewer.pal(4,"Accent"),"bar")

demoplot(brewer.pal(11,"Spectral"),"heatmap")

demoplot(brewer.pal(11,"BrBG"),"heatmap") # can change the palette, can choose the color on the display.brewer.all() 

my_cols <- c("grey75",brewer.pal(3,"Blues"))
p_fil + scale_fill_manual(values=my_cols)

# nice for seeing hex values!
#hex values ----
library(scales)
show_col(my_cols)

#Viridis palette ----
#### Making a heat map----
xVar <- 1:30
yVar <- 1:5
myData <- expand.grid(xVar=xVar,yVar=yVar)
head(myData)

zVar <- myData$xVar + myData$yVar + 2*rnorm(n=150)
myData <- cbind(myData,zVar)
head(myData)

# default gradient colors in ggplot
p4 <- ggplot(myData) +
  aes(x=xVar,y=yVar,fill=zVar) +
  geom_tile()
print(p4)

# user defined divergent palette
p4 + scale_fill_gradient2(midpoint=19,
                          low="brown",
                          mid=grey(0.8),
                          high="darkblue")
#viridis scale
#viridis convert nicely to grey scale and done to have contrast 
p4  + scale_fill_viridis_c()

# options viridis, cividis, magma, inferno, plasma
p4 + scale_fill_viridis_c(option="inferno")

#desaturated viridis
p4 <- p4 + geom_tile() + scale_fill_viridis_c() 
p4des<-edit_colors(p4, desaturate)
plot(p4des)
