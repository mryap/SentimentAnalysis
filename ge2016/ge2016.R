#install.packages("base64enc")

#library(httr)
library(twitteR)
library(base64enc)

#consumer_key <- 'kDbigJNR6f9BMu6o2Sy95IJp2'
#consumer_secret <- 'oXB0795wCX0KwaMC8kT3DgUk45Zv94Bu2DMFVqak0dYUTordEk'
#access_token <- '9465632-warwshtU6ax4XsrHYPc5llNWMe17xqAczznh6AH0NN'
#access_secret <- 'XULeCzfftRUqUUrzj3Hla2Uv29YU7eojRBE27akvLUnGZ'

#setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#save(setup_twitter_oauth, file='twitter_authentication.Rdata')

load('twitter_authentication.Rdata') 
#Once you launched the code first time, you can start from this line in the future (libraries should be connected)

tweets<-searchTwitter("#ge16", n=500,lang='en')

datTweet<-plyr::ldply(tweets,as.data.frame)

