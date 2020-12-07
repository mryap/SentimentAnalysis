install.packages("base64enc")

library(httr)
#library(httpuv)
library(twitteR)
library(base64enc)
library(tm)

consumer_key <- 'kDbigJNR6f9BMu6o2Sy95IJp2'
consumer_secret <- 'oXB0795wCX0KwaMC8kT3DgUk45Zv94Bu2DMFVqak0dYUTordEk'
access_token <- '9465632-warwshtU6ax4XsrHYPc5llNWMe17xqAczznh6AH0NN'
access_secret <- 'XULeCzfftRUqUUrzj3Hla2Uv29YU7eojRBE27akvLUnGZ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets<-searchTwitter("#ge16", n=150000,lang='en')

datTweet<-plyr::ldply(tweets,as.data.frame)
vecStatus <- datTweet$text

str(tweets)

summary(tweets)

head(tweets)
tail(tweets)


#Clean Text
vecStatus = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",vecStatus)
vecStatus = gsub("http[^[:blank:]]+", "", vecStatus)
vecStatus = gsub("@\\w+", "", vecStatus)
vecStatus = gsub("[ \t]{2,}", "", vecStatus)
vecStatus = gsub("^\\s+|\\s+$", "", vecStatus)
vecStatus <- gsub('\\d+', '', vecStatus)
vecStatus = gsub("[[:punct:]]", " ", vecStatus)

# additional cleaning by tm library
library(tm)
corpus = Corpus(VectorSource(vecStatus))
corpus = tm_map(corpus,removePunctuation)
corpus = tm_map(corpus,stripWhitespace)
corpus = tm_map(corpus,tolower)
corpus = tm_map(corpus,removeWords,stopwords("english"))

library(wordcloud)
wordcloud(corpus)

dim(tweets)

#store the final dataset in an R data (rda) file on disk. 
#This provides an efficient storage mechanism for R objects

save(tweets, file='tweets.rda',compress=T)


