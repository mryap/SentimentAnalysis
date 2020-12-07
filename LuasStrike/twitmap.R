source("http://biostat.jhsph.edu/~jleek/code/twitterMap.R")

twitterMap("mryap")

twitterMap <- function(mryap,userLocation=NULL,fileName=”twitterMap.pdf”,nMax = 1000,plotType=c(“followers”,”both”,”following”))