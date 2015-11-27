# set working directory
setwd(dir="~/Dropbox/berkeley/Git-Repos/PS239T/09_APIs")

# read CSV

duke.articles <- read.csv("allduke.csv")
names(duke.articles)

# Add year-month indicators
duke.articles$year.month<-format(as.Date(duke.articles$date), "%Y-%m")
duke.articles$year.month<-as.Date(paste0(duke.articles$year.month, "-01"))

# Count articles per month
library(plyr)
duke.permonth<-ddply(.data = duke.articles, .variables = "year.month", summarize, count=length(year.month))

# Plot the trend over time
library(ggplot2)
ggplot(data = duke.permonth, aes(x = year.month, y = count))+geom_point()+stat_smooth() +
  theme_bw()+xlab(label = "Date")+ylab(label = "Article Count")+ggtitle(label = "Coverage of Duke Ellington")
```
