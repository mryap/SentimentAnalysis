library(twitteR)

consumer_key <- 'kDbigJNR6f9BMu6o2Sy95IJp2'
consumer_secret <- 'oXB0795wCX0KwaMC8kT3DgUk45Zv94Bu2DMFVqak0dYUTordEk'
access_token <- '9465632-warwshtU6ax4XsrHYPc5llNWMe17xqAczznh6AH0NN'
access_secret <- 'XULeCzfftRUqUUrzj3Hla2Uv29YU7eojRBE27akvLUnGZ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

load('twitter_authentication.Rdata') 

tweets <- searchTwitter('Top Gear', n=50)

head(tweets)

dataTweet<-plyr::ldply(tweets,as.data.frame)

#strip_retweets which takes a list of status objects (e.g. from searchTwitter)
#and by default will remove official API-based retweets from Twitter, i.e.
#cases where the retweet button was pressed instead of the manual RT
head(strip_retweets(tweets, strip_manual=TRUE, strip_mt=TRUE))

dataTweet<-plyr::ldply(strip_retweets,as.data.frame)

Katlyn_Hanson <- getUser('Katlyn_Hanson')
Katlyn_Hanson$getDescription()
Katlyn_Hanson$getFollowersCount()

Katlyn_Hanson$getFriends(n=5)
Katlyn_Hanson$getFavorites(n=5)


#mryap <- getUser('mryap')
#mryap$getDescription()
#mryap$getFollowersCount()

#mryap$getFriends(n=12)
#mryap$getFavorites(n=5)

df <- twListToDF(tweets)
head(df)


avail_trends = availableTrendLocations()
head(avail_trends)