setwd("~/Dropbox/berkeley/PS239T/text-analysis")
rm(list=ls())

library(tm)
library(RTextTools)
library("matrixStats")

# make DTM using rTextTools method
documents <-read.csv("Data/shelbysessions.csv", header=TRUE) #read in CSV file
names(documents)
dtm <- create_matrix(documents[["text"]], language="english", removeNumbers=TRUE,
                       stemWords=TRUE, removeSparseTerms=.9, toLower = TRUE, 
                       removePunctuation = TRUE)

findFreqTerms(dtm, lowfreq=100) # have a look at common words
findAssocs(dtm, "women", 0.2)

# coerce into dataframe
dtm <- as.data.frame(inspect(dtm)) # 275 terms
# add column for author
dtm$document_author <- documents$author
# check to see if they're the same number of documents per author
summary(dtm$document_author)
summary(documents$author)

# Subset into 2 dtms

shelby <- subset(dtm,document_author=="Shelby",select = -document_author) # should have 1102 obs.
sessions <- subset(dtm,document_author=="Sessions",select = -document_author) # should have 236 obs.


#### standardized mean difference

# calculate means and vars
n.shelby <- sum(colSums(shelby))
n.sessions <- sum(colSums(sessions))
means.shelby <- colMeans(shelby)
var.shelby <- colVars(as.matrix(shelby))
means.sessions <- colMeans(sessions)
var.sessions <- colVars(as.matrix(sessions))
  
#calculate overall score
score <- (means.shelby - means.sessions) / sqrt((var.shelby/n.shelby) + (var.sessions/n.shelby))

# sort and view
score <- sort(score)
sessions_top <- head(score,10)
shelby_top <- tail(score,10)


##### Scrap Notes
#####

# another way to make DTM - from tm

a <- Corpus(DirSource("Data/Sessions")) #directory that contains just text files, each document is a different file.

a <- tm_map(a, content_transformer(tolower)) # convert all text to lower case
a <- tm_map(a, removePunctuation) 
a <- tm_map(a, removeNumbers)
a <- tm_map(a, removeWords, stopwords("english"))
a <- tm_map(a, stemDocument)

dtm.sessions <- DocumentTermMatrix(a)

