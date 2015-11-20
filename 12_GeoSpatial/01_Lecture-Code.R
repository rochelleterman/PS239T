#### Prepared for PS239T Guest Lecture: Intro to spatial analysis in R
#### Instructor: Shinhye Choi
#### contact: schoi [at] berkeley.edu for suggestions

rm(list = ls())

### installing spatial data packages
x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", 
"sp", "ggplot2", "scales",  "maps")
install.packages(x)                             # remember, you only install a package once!
lapply(x, library, character.only = TRUE)       # you could library them all at once.


### Topic: map plotting with built-in map data
### required package: ggplot2, maps

setwd("~/Dropbox/Dlab/SpatialPlot")          # set your own working directory

library(ggplot2)
library(maps)

# retrieve a map from the "maps" package 
# ?map_data
world <- map_data("world")                        
ggplot(world, aes(x=long, y=lat)) +   
              geom_path(aes(group=group)) 

# let's talk about the object 
# group, order - what do they mean? 
# group: grouping for each polygon.
head(world)

# a country may have multiple polygons:
# which country do you think should have more data points? why?
length(which(world$region=="India"))               
length(which(world$region=="Canada"))

# Plot one region: India
p1 <- ggplot(world[world$region=="India",], aes(x=long, y=lat)) +   
              geom_path(aes(group=group))   # what doesnt look right? Compare to this:

p2 <- ggplot(world[world$region=="India",], aes(x=long, y=lat)) +   
              geom_path(aes(group=group)) + coord_map("mercator") 
multiplot(p1, p2, cols=2)

# Map projectons & coord ref systems CRS: 
# Geographic CRS - coordinates specify geographic locations on a 3d sphere. Look weird in 2d
# Projected CRS (also called map projections) specify geographic location on 2d plane
# All projections introduce distortion in shape, area, distance or direction. Or some combo

# there are multiple ways to map the same regions 
## "ways" in terms of style (color) and feature type (point line or polygon), 
#   or subset/region selection or Coord Ref System (CRS)

# subset/region selection
north_a_countries <- map_data("world", region=c("USA", "Canada"))
north_a <- subset(north_a_countries, long < -50 & lat > 20)
# So if CA between +32 and +48 lat and =114 and -122 long try subsetting that region

# we want to plot a better map of North America than this
ggplot(north_a_countries, aes(x=long, y=lat)) +
  geom_polygon(aes(group=group)) 

# with different prj
p1 <- ggplot(north_a, aes(x=long, y=lat)) +   
          geom_path(aes(group=group))

p2 <- ggplot(north_a, aes(x=long, y=lat)) +   
          geom_path(aes(group=group)) + 
          coord_map("mercator")

multiplot(p1, p2, cols=2)

# Points, Lines, & Polygons
ggplot(north_a, aes(x=long, y=lat)) +
  geom_polygon(aes(group=group)) + coord_map("mercator")

ggplot(north_a, aes(x=long, y=lat)) +
  geom_point(aes(group=group)) + coord_map("mercator")

ggplot(north_a, aes(x=long, y=lat)) +
  geom_path(aes(group=group)) + coord_map("mercator")

# Symbolizing Paths (or Lines)
ggplot(north_a, aes(x=long, y=lat)) +
  geom_path(aes(group=group), color="red") + coord_map("mercator")

# symbolizing polygons
ggplot(north_a, aes(x=long, y=lat)) +
  geom_polygon(aes(group=group, fill=region)) + coord_map("mercator")

ggplot(north_a, aes(x=long, y=lat)) +
  geom_polygon(aes(group=group, fill=region), color="blue") + coord_map("mercator")

# Using Color Palettes
# Save the plot created by the code above and then add a color palette to fill the regions.
p1 <- ggplot(north_a, aes(x=long, y=lat)) +
       geom_polygon(aes(group=group, fill=region),  colour="NA") + coord_map("mercator")

p2 <- p1 +   labs(title = "Population by State", fill = "") +
             theme_nothing(legend=TRUE)                           # what just happened?
multiplot(p1, p2, cols=2)
ggsave("p2.png", width = 9, height = 9)                           # save ggplot figures


# still another possibiilty
states <- map_data("state")        # ??map_data for available regions
ggplot(states, aes(x=long, y=lat)) +
  geom_polygon(aes(group=group,  fill=region), colour="black", fill="white")   # fill="white"

# explain
## why important: points define location, connected points define lines, closed lines define polygons
## colour/color is for the geom data (point, line, polygon), 
# fill="color" is an attribute of region - no meaning for points or paths/lines


### Topic 3: Plotting Spatial Points onto a Map retreived from the Goolge Maps API
# required package: ggmap (retrieving a map from the Google Maps API)

# Geocoding
# Let's use the geocode() function to get the coordinates for an address. 

library(ggmap)
geocode("Berkeley, CA", source="google")
x <- geocode("Barrows Hall, Berkeley, CA 94720-1950", source="google") #run on command line - but we need different format
class(x)

# Point Maps 
# The most common types of point maps are:
# dot maps: plot point locations using a single color or icon
# categorical dot maps: color code the points by category
# proportional symbol maps: scale the symbol size based on an attribute value.
data(us.cities)
str(us.cities)

# subset cities - just bay area - get lat lon from
bayarea_map <-get_map('Berkeley',zoom=8)
ggmap(bayarea_map)

bayarea_cities <- subset(us.cities, (long < -120 & long > -124) & (lat > 36 & lat <40)) # Patty: explain what and why
dim(bayarea_cities)

# now plot the cities in the bay area
ggmap(bayarea_map) +
  geom_point(data=bayarea_cities, aes(x=long, y=lat))


#### Topic: Plotting your data!!
# Thus far we have created maps using data from the R maps and ggmaps packages.
# lets add local point data

# Make sure you have csv files in your working directory.
# data: cafes where I go often. let's not argue about my personal preferences.
cafe <- read.csv("cafe.csv")
head(cafe)
str(cafe)

map <- get_map("Berkeley", zoom=14)                 # retrieve a map from Gmap API

# Let's create a cateogry dot map (or pin map)
ggmap(map) +
  geom_point(aes(x = long, y = lat, size = 4, colour = I(name)), 
             data = cafe, alpha = .9)                # geom_points!
# Note: In the above code the I() sets the a color for each unique value of name.
# If the column values are numbers not strings you need to use factor() instead.


# create a proportional symbol map
g <- ggmap(map) +
         geom_point(aes(x = long, y = lat, size = price), 
                    colour = "red", data = cafe, alpha = 1)                # geom_points!
#let's scale the symbol size by the price but make it a bit bigger by adding 2


# add a title, remember how?  # + labs(title = "Coffee Prices in Berkeley") 
# and remove axis, remember how?
g <- g + labs(title = "Coffee Prices in Berkeley") 
multiplot(g, g + theme_nothing(legend=TRUE), cols=2)


### Topic: Mapping Spatial Data Objects with the Base Plotting System
# Thus far we have mapped data where the geographic locations are 
# stored in a data frame as numbers in columns labeled lat and lon. 
# We will now work with explicit spatial data which store 
# geographic locations aspoints, lines and polygons objects. 
# FYI here is a really nice cheat sheet for working with spatial data in R:
# http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html

library(sandwich)
library(classInt)
library(RColorBrewer)
library(sp)
library(maptools)
library(rgeos)
library(rgdal)  # allows for datum transformation and projection 

# library(sp): different classes of spatial data objects in the sp package
getClass("Spatial")
getClass("SpatialPoints")

#### spatialpoints
# create a Spatial Points object from the cafe dat data frame. 
# First, extract the coordinates (long, lat) from the data frame.
# data: cafes where I go often. let's not argue about my personal preferences.
dat <- read.csv("cafe.csv")
head(dat)
class(dat)

# take out coordinates (long, lat)
dat_coords <- cbind(dat$long, dat$lat)
row.names(dat_coords) <- dat$name
str(dat_coords)

# create a spatialpoints object
dat_sp <- SpatialPoints(dat_coords, 
                        proj4string=CRS("+proj=longlat + ellps=WGS84"))
class(dat_sp)
str(dat_sp) 
summary(dat_sp)

slot(dat_sp, "coords")
bbox(dat_sp)
proj4string(dat_sp)

# subset the data: I want to know the location of Strada..
coordinates(dat_sp)[which(row.names(dat_sp)=="strada"),]

# basic plot
plot(dat_sp)
points(coordinates(dat_sp)[which(row.names(dat_sp)=="strada"),1],
       coordinates(dat_sp)[which(row.names(dat_sp)=="strada"),2],col="red", pch=20)

# find cafes that are located north to barrows hall
# barrows hall: -122.258016, 37.870151
points(coordinates(dat_sp)[which(coordinates(dat_sp)[,2] > 37.870151),1],
       coordinates(dat_sp)[which(coordinates(dat_sp)[,2] > 37.870151),2],col="blue", pch=20)

# Explore Spatial data with rgdal package
# crs and projection
# ### codes for plots included in the slides
library(rgdal)

# crs and projection
# ### codes for plots included in the slides
setwd("~/Dropbox/Dlab/DlabSpatialPlot")
ogrInfo(".", "uc_bldgs")
uc_bd <- readOGR(dsn=".", layer="uc_bldgs") 
summary(uc_bd)

# load other data
ogrInfo(".", "uc_bnd")
uc_bnd <- readOGR(dsn=".", layer="uc_bnd") 

ogrInfo(".", "censusblk")
census <- readOGR(dsn=".", layer="censusblk") 

uc_bdT  <- spTransform(uc_bd, CRS("+proj=longlat +ellaps=WGS84"))
censusT <- spTransform(census, CRS("+proj=longlat +ellaps=WGS84"))

pdf(file = paste("types", Sys.Date(), ".pdf", sep = ""),
    height = 6, width = 8)
plot(dat$long, dat$lat, col="red", pch=16, cex=2, axes=F)
dev.off()

pdf(file = paste("types1", Sys.Date(), ".pdf", sep = ""),
    height = 6, width = 8)
plot(uc_bdT)
plot(censusT, add=T)
points(-122.258016, 37.870151, col="blue", pch=16, cex=2)
points(dat$long, dat$lat, col="red", pch=16, cex=2)
dev.off()

# SpatialPointsDataFrame: matching on ID names
all.equal(row.names(dat), row.names(dat_sp))
data <- SpatialPointsDataFrame(dat_sp[match(row.names(dat), row.names(dat_sp)),],
                               dat, 
                               proj4string = CRS(dat_sp),
                               match.ID =TRUE) 
row.names(dat) <- dat$name
all.equal(row.names(dat), row.names(dat_sp))
data <- SpatialPointsDataFrame(dat_sp[match(row.names(dat), row.names(dat_sp)),],
                               dat, 
                               proj4string = CRS(dat_sp),
                               match.ID =TRUE) 
class(data)

# combine a new variable

var  <- read.csv("var.csv", stringsAsFactors=F)
data <- cbind(data, var)
class(data)

# spCbind
row.names(var) <- var$name
data <- SpatialPointsDataFrame(dat_sp[match(row.names(dat), row.names(dat_sp)),],
                               dat, 
                               proj4string = CRS(dat_sp),
                               match.ID =TRUE) 
class(data)

data <- spCbind(data, var[match(row.names(data), row.names(var)),])
class(data)

# SpatialLines
getClass("Line")
getClass("Lines")
getClass("SpatialLines")



# look into the data
plot(uc_bd)
plot(uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], add=TRUE, col="blue")
plot(uc_bd[which(uc_bd$NAME2=="Lawrence Hall of Science"),], add=TRUE, col="red")
plot(uc_bd[which(uc_bd$NAME2=="Sproul Hall"),], add=TRUE, col="red")

# plot all maps
plot(uc_bd)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(census, add=T, border="grey")

# let's look at the census attribute data
# plot white pop density for each block
cls<- classIntervals(census$WHITE, 5, style = "quantile")
colpal<- findColours(cls, brewer.pal(5, "BuGn"))
plot(census, border="grey", col=colpal)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(uc_bd, add=T)

# pop density
cls<- classIntervals(census$POP_DENS, 5, style = "quantile")
colpal<- findColours(cls, brewer.pal(5, "OrRd"))
plot(census, border="grey", col=colpal)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(uc_bd, add=T)

# rent
cls<- classIntervals(census$RENT, 5, style = "quantile")
colpal<- findColours(cls, brewer.pal(5, "PuRd"))
plot(census, border="grey", col=colpal)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(uc_bd, add=T)

# getting a little complicated
x <- slot(slot(slot(census, "polygons")[[1196]], "Polygons")[[1]], "coords")
plot(census, border="grey")
lines(x, col="red", cex=1.5, pch=16)
dim(census)

# disaggregate the code
proj <- "+proj=lcc +lat_1=37.06666666666667 +lat_2=38.43333333333333 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000.0000000001 +datum=NAD83 +units=us-ft +no_defs +ellps=GRS80 +towgs84=0,0,0"
blocks   <- lapply(slot(census, "polygons"), 
                   function(x) SpatialPolygons(list(x), 
                                               proj4string=CRS(proj)))
class(blocks)
blocks[[dim(census)[1]]]

census$census.id <- NA
plot(census, border="grey")
for(i in 1:dim(census)[1]){
  if(i < 201){
    plot(blocks[i][[1]], border='red',lwd=2, add=T)
    census$census.id[i] <- 1 
  }
  if(i> 200 & i<501){
    plot(blocks[i][[1]], border='blue',lwd=2, add=T) 
    census$census.id[i] <- 2
  }
  if(i> 500 & i<901){
    plot(blocks[i][[1]], border='green',lwd=2, add=T) 
    census$census.id[i] <- 3
  }
  if(900 < i){
    plot(blocks[i][[1]], border='gold',lwd=2, add=T) 
    census$census.id[i] <- 4
  }
}

# useful functions for spatial analysis
# calculate the distance between barrows to each cafe
proj <- "+proj=lcc +lat_1=37.06666666666667 +lat_2=38.43333333333333 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000.0000000001 +datum=NAD83 +units=us-ft +no_defs +ellps=GRS80 +towgs84=0,0,0"
dataT <- spTransform(data, CRS(proj))
dist <- gDistance(dataT, uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], byid=TRUE)

plot(census, border="grey")
points(dataT[which(dist==min(dist)),], col="red",  pch=16)
points(dataT[which(dist==max(dist)),], col="blue", pch=16)
plot(uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], add=T, col="blue")

# which cafes lie within 500 ft 
plot(uc_bd, border="grey")
plot(gBuffer(uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], width=500, 
             quadsegs=5), col="yellow", lwd=2, cex=2, add=TRUE)  
plot(uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], add=T, col="blue")


# overlay
buff <- gBuffer(uc_bd[which(uc_bd$NAME2=="Barrows Hall"),], width=500, 
                quadsegs=5)
over(dataT, buff, returnList = TRUE)
over(buff, dataT, returnList = TRUE)

# overlaying with oakland data
setwd("~/Dropbox/Dlab/SpatialPlot/oakland_blkgrp")
ogrInfo(".", "oakland_blkgrp")
sp_dat  <- readOGR(dsn=".", layer="oakland_blkgrp") 
sp_datT <- spTransform(sp_dat, CRS("+proj=longlat +ellaps=WGS84"))


# compare the following two plots
par(mar = c(4.5, 4.5, 1.5, 0), mfrow = c(1, 2), cex = .6)
plot(census, border="grey")
plot(sp_dat, border="blue", add=T)

plot(census, border="grey")
plot(gUnaryUnion(sp_dat), border="blue", add=T)
dev.off()


# which are the boundary regions?
# there are various ways you can do this. I offer one.
# creating a boundary line:
plot(sp_dat, border="blue")
blocks   <- lapply(slot(sp_dat, "polygons"), 
                   function(x) SpatialPolygons(list(x), 
                                               proj4string=CRS(proj)))
sp_dat$id <- NA
plot(sp_dat, border="grey")
for(i in 1:dim(sp_dat)[1]){
  if(i < 91){
    plot(blocks[i][[1]], border='red',lwd=2, add=T)
    sp_dat$id[i] <- 1 
  }
  if(90 < i){
    plot(blocks[i][[1]], border='blue',lwd=2, add=T) 
    sp_dat$id[i] <- 2
  }
}

sp_dat.union <- unionSpatialPolygons(sp_dat, sp_dat$id)
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)

# find boundary regions
setwd("~/Dropbox/Dlab/SpatialPlot")
load("bd.RData")
bd<- SpatialLines(list(Lines(list(Line(z)), ID = 1)),
                  proj4string=CRS(proj))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(bd, add=T, col="red", lwd=2)

buff <- gBuffer(bd, width=800, quadsegs=5)
plot(sp_dat[row.names(over(buff, sp_dat, returnList = TRUE)[[1]]),], add=T, col="red")
plot(buff, col="yellow", add=T)

# find the neighborhoods
study <- sp_dat[row.names(over(buff, sp_dat, returnList = TRUE)[[1]]),]

study$whiteper <- study$WHITE/study$POP2000     
t.test(study$whiteper[which(study$id==1)],
       study$whiteper[which(study$id==2)])

cls<- classIntervals(study$whiteper, 5, style = "quantile")
colpal<- findColours(cls, brewer.pal(5, "BuGn"))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(study[which(study$id==1),], col=colpal, add=T)
plot(study[which(study$id==2),], col=colpal, add=T)
plot(bd, add=T, col="red", lwd=2)


# other variable sorting?
t.test(study$POP2000[which(study$id==1)],
       study$POP2000[which(study$id==2)])

cls<- classIntervals(study$POP2000, 5, style = "quantile")
colpal<- findColours(cls, brewer.pal(5, "GnBu"))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(study[which(study$id==1),], col=colpal, add=T)
plot(study[which(study$id==2),], col=colpal, add=T)
plot(bd, add=T, col="red", lwd=2)

#--- WORKS END -----
#### UC spatial data available at
#### http://ced.berkeley.edu/faculty/ratt/downloads/CCanyon/lab4Proj_files.zip 
#### Disclaimer: I do not own the UC spatial data. Anyone interested in the data
#### for other purposes should contact the owner directly.
#### Reference book: Applied Spatial Data Analysis with R, 2nd edition
################################################



multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}