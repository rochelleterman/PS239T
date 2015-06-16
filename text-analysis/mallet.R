#playing with Mallet

setwd("~/Dropbox/berkeley/PS239T/text-analysis")
rm(list=ls())

# load data
documents <- read.csv('Data/women.csv')
names(documents)
documents$X <- NULL

# remove puncutation and numbers
documents$text <- as.character(documents$text)
documents$text <- gsub("[[:punct:]]", "", documents$text)
documents$text  = gsub("[[:digit:]]", "", documents$text)

###################
##### Mallet ######
###################

# load data
library(mallet)
mallet.instances <- mallet.import(documents$id, documents$text, "Data/stoplist.csv", FALSE, token.regexp="[\\p{L}']+")

## Create a topic trainer object.
topic.model <- MalletLDA(num.topics=15)

## Load our documents
topic.model$loadDocuments(mallet.instances)

## Get the vocabulary, and some statistics about word frequencies.
##  These may be useful in further curating the stopword list.
vocabulary <- topic.model$getVocabulary()
word.freqs <- mallet.word.freqs(topic.model)

# examine some of the vocabulary
word.freqs[1:50,]

## Optimize hyperparameters every 20 iterations, 
##  after 50 burn-in iterations.
topic.model$setAlphaOptimization(20, 50)

## Now train a model. Note that hyperparameter optimization is on, by default.
##  We can specify the number of iterations. Here we'll use a large-ish round number.
topic.model$train(200)

## Get the probability of topics in documents and the probability of words in topics.
## By default, these functions return raw word counts. Here we want probabilities, 
##  so we normalize, and add "smoothing" so that nothing has exactly 0 probability.
doc.topics <- mallet.doc.topics(topic.model, smoothed=T, normalized=T)
topic.words <- mallet.topic.words(topic.model, smoothed=T, normalized=T)

## What are the top words in topic 7?
##  Notice that R indexes from 1, so this will be the topic that mallet called topic 6.
mallet.top.words(topic.model, topic.words[6,])

## Get a vector containing short names for the topics
n.topics <- 15
topics.labels <- rep("", n.topics)
for (topic in 1:n.topics) 
  topics.labels[topic] <- paste(mallet.top.words(topic.model, topic.words[topic,], num.top.words=5)$words, collapse=" ")

# have a look at keywords for each topic
topics.labels

## Show the first few documents with at least 5
head(documents[ doc.topics[7,] > 0.05 & doc.topics[10,] > 0.05, ])

## How do topics differ across different sub-corpora?
mena.topic.words <- mallet.subset.topic.words(topic.model, documents$region == "MENA",
                                              smoothed=T, normalized=T)
west.topic.words <- mallet.subset.topic.words(topic.model, documents$region == "West",
                                              smoothed=T, normalized=T)

mallet.top.words(topic.model, mena.topic.words[8,])
mallet.top.words(topic.model, west.topic.words[8,])

# Visualize topics as word clouds
# be sure you have installed the wordcloud package
library(wordcloud)
topic.num <- 1
num.top.words<-100
topic.top.words <- mallet.top.words(topic.model, topic.words[1,], 100)
wordcloud(topic.top.words$words, topic.top.words$weights, c(4,.8), rot.per=0, random.order=F)

num.topics<-15
num.top.words<-25
for(i in 1:num.topics){
  topic.top.words <- mallet.top.words(topic.model, topic.words[i,], num.top.words)
  wordcloud(topic.top.words$words, topic.top.words$weights, c(4,.8), rot.per=0, random.order=F)
}

#####################
# Clustering
# from https://github.com/shawngraham/R/blob/master/topicmodel.R
#####################

# from http://www.cs.princeton.edu/~mimno/R/clustertrees.R
## transpose and normalize the doc topics
topic.docs <- t(doc.topics)
topic.docs <- topic.docs / rowSums(topic.docs)

# create data.frame with columns as people and rows as topics
topic_docs <- data.frame(topic.docs)
names(topic_docs) <- documents$id

## cluster based on shared words
plot(hclust(dist(topic.words)), labels=topics.labels)

#' Calculate similarity matrix
#' Shows which documents are similar to each other
#' by their proportions of topics. Based on Matt Jockers' method
library(cluster)
topic_df_dist <- as.matrix(daisy(t(topic_docs), metric = "euclidean", stand = TRUE))

# Change row values to zero if less than row minimum plus row standard deviation
# keep only closely related documents and avoid a dense spagetti diagram
# that's difficult to interpret (hat-tip: http://stackoverflow.com/a/16047196/1036500)
topic_df_dist[ sweep(topic_df_dist, 1, (apply(topic_df_dist,1,min) + apply(topic_df_dist,1,sd) )) > 0 ] <- 0

#' Use kmeans to identify groups of similar authors
km <- kmeans(topic_df_dist, n.topics)

# get names for each cluster
allnames <- vector("list", length = n.topics)
for(i in 1:n.topics){
  allnames[[i]] <- names(km$cluster[km$cluster == i])
} 

# Visualize people similarity using force-directed network graphs

#### network diagram using Fruchterman & Reingold algorithm
# static
# if you don't have igraph, install it by removing the hash below:
# install.packages("igraph")
library(igraph)
g <- as.undirected(graph.adjacency(topic_df_dist))
layout1 <- layout.fruchterman.reingold(g, niter=500)
plot(g, layout=layout1, edge.curved = TRUE, vertex.size = 1, vertex.color= "grey", edge.arrow.size = 0, vertex.label.dist=0.5, vertex.label = NA)


# interactive in a web browser
# if you have a particularly large dataset, you might want to skip this section, and just run the Gephi part.
# if you don't have devtools, install it by removing the hash below:
# install.packages("devtools")

devtools::install_github("christophergandrud/networkD3")
require(d3Network)
d3SimpleNetwork(get.data.frame(g),width = 1500, height = 800,
                textColour = "orange", linkColour = "red",
                fontsize = 10,
                nodeClickColour = "#E34A33",
                charge = -100, opacity = 0.9, file = "d3net.html")

# find the html file in working directory and open in a web browser
