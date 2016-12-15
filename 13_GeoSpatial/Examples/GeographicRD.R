setwd("~/Dropbox/Dlab/PS239T_Fall2016") # set YOUR working directory to the folder where you unzipped the workshop materials


# install the following packages:
library(foreign)
library(sandwich)
library(classInt)
library(RColorBrewer)
library(sp)
library(maptools)
library(rgeos)
library(rgdal)  # allows for datum transformation and projection 

# library(sp)
getClass("Spatial")
getClass("SpatialPoints")

#### spatialpoints

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


# crs and projection
# ### codes for plots included in the slides
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

pdf(file = paste("types2", Sys.Date(), ".pdf", sep = ""),
    height = 6, width = 8)
plot(uc_bdT)
plot(censusT, add=T)
points(-122.258016, 37.870151, col="blue", pch=16, cex=2)
points(dat$long, dat$lat, col="red", pch=16, cex=2)
lines(dat$long, dat$lat, col="red", lwd=2)
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
var  <- read.csv("var.csv")
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

# SpatialPolygons data
getClass("SpatialPolygons")

ogrInfo(".", "uc_bldgs")
uc_bd <- readOGR(dsn=".", layer="uc_bldgs") 
summary(uc_bd)

# load other data
ogrInfo(".", "uc_bnd")
uc_bnd <- readOGR(dsn=".", layer="uc_bnd") 

ogrInfo(".", "censusblk")
census <- readOGR(dsn=".", layer="censusblk") 


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
class <- classIntervals(census$WHITE, 5, style = "quantile")
colpal<- findColours(class, brewer.pal(5, "BuGn"))
plot(census, border="grey", col=colpal)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(uc_bd, add=T)

# pop density
class <- classIntervals(census$POP_DENS, 5, style = "quantile")
colpal<- findColours(class, brewer.pal(5, "OrRd"))
plot(census, border="grey", col=colpal)
plot(uc_bnd, add=T, border="blue", lwd=2)
plot(uc_bd, add=T)

# rent
class <- classIntervals(census$RENT, 5, style = "quantile")
colpal<- findColours(class, brewer.pal(5, "PuRd"))
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
load("bd.RData")
bd<- SpatialLines(list(Lines(list(Line(z)), ID = 1)),
                  proj4string=CRS(proj))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(bd, add=T, col="red", lwd=2)

buff <- gBuffer(bd, width=800, quadsegs=5)
plot(sp_dat[as.numeric(rownames(over(buff, sp_dat, returnList = TRUE)[[1]])),], add=T, col="red")
plot(buff, col="yellow", add=T)

# find the neighborhoods
study <- sp_dat[as.numeric(rownames(over(buff, sp_dat, returnList = TRUE)[[1]])),]

study$whiteper <- study$WHITE/study$POP2000     
t.test(study$whiteper[which(study$id==1)],
       study$whiteper[which(study$id==2)])

class <- classIntervals(study$whiteper, 5, style = "quantile")
colpal<- findColours(class, brewer.pal(5, "BuGn"))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(study[which(study$id==1),], col=colpal, add=T)
plot(study[which(study$id==2),], col=colpal, add=T)
plot(bd, add=T, col="red", lwd=2)


# other variable sorting?
t.test(study$POP2000[which(study$id==1)],
       study$POP2000[which(study$id==2)])

class <- classIntervals(study$POP2000, 5, style = "quantile")
colpal<- findColours(class, brewer.pal(5, "GnBu"))
plot(sp_dat,  border="grey")
plot(sp_dat.union, add=T)
plot(study[which(study$id==1),], col=colpal, add=T)
plot(study[which(study$id==2),], col=colpal, add=T)
plot(bd, add=T, col="red", lwd=2)