library(httr)
library(twitteR)
library(base64enc)

load('twitter_authentication.Rdata') 

tweets<-searchTwitter("#ge16", n=500,lang='en')

dataTweet<-plyr::ldply(tweets,as.data.frame)