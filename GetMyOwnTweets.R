

library(twitteR)
library(RCurl)

consumer_key<-"fPE6hHZNCMsxzadDOgMVUCOMJ"
consumer_secret<-"EsdOXtpQVvdPOSaOaAQrinq0j8IO5Tp0V6HjTaFmLvJiOhSVrW"
access_token<- "744897891311976448-ZtUYULc0kgBe3o3pdmBEvX9UVSpVPwU"
access_secret<-"8vdobvIjTsbCl0HDz7WaV8lk40QIicBbvtM1Nq3xaqJ9o"





setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret )


resp= searchTwitter(searchString="Machine Learning Twitter API Scraping testing to see if we can learn that a Tweet returned via RESTful API has pic")
