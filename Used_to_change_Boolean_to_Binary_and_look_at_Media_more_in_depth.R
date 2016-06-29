# install.packages("devtools")
# devtools::install_github("joyofdata/RTwitterAPI")

library(RTwitterAPI)

consumer_key<-"fPE6hHZNCMsxzadDOgMVUCOMJ"
consumer_secret<-"EsdOXtpQVvdPOSaOaAQrinq0j8IO5Tp0V6HjTaFmLvJiOhSVrW"
access_token<- "744897891311976448-ZtUYULc0kgBe3o3pdmBEvX9UVSpVPwU"
access_secret<-"8vdobvIjTsbCl0HDz7WaV8lk40QIicBbvtM1Nq3xaqJ9o"



params <- c(
  "oauth_consumer_key"     = consumer_key,
  "oauth_nonce"            = NA,
  "oauth_signature_method" = "HMAC-SHA1",
  "oauth_timestamp"        = NA,
  "oauth_token"            = access_token,
  "oauth_version"          = "1.0",
  "consumer_secret"        = consumer_secret,
  "oauth_token_secret"     = access_secret
);

# https://dev.twitter.com/docs/api/1.1/get/followers/ids
url   <- "https://api.twitter.com/1.1/statuses/show.json";
# p2<-paste("&","id=",664811897414221824, sep="")
# p1<-"&include_entities=true"
# p3<-"&include_my_retweet=false"
query <- c(id=747227503329173505);

#load("C:\\Users\\MuhammadAyub\\Documents\\Coding_In_General\\R\\saved_noRetweet1_backup2.RData")

#stop("looky hr")
#noRetweet1["has_media_"] <- NA  
# noRetweet1["media_type"]<-NA 
# noRetweet1["media_tech"] <- NA 

nums<-noRetweet1[,1]

zenga=0
jenga=0

#json_result <- RTwitterAPI::twitter_api_call(url, query, params, print_result=TRUE)

  for(x in 1:length(noRetweet1[,1])){
 
     # if(noRetweet1[x, "has_media"]){
     #   #print ("olay")
     #   zenga=zenga+1
     #   noRetweet1[x, "has_media_"] = 1
     # }else{
     #   noRetweet1[x, "has_media_"] = 0
     # }
    
    if(noRetweet1[x, "has_media_"]==1 && is.na(noRetweet1[x, "visited"])){
      noRetweet1[x, "visited"]=1
      
      #get the json data
      temp=as.numeric(nums[x])
      # print(temp)
      query <- c(id=temp)
      print(toString(query[[1]]))
      jenga=jenga+1
      
      json_result <- RTwitterAPI::twitter_api_call(url, query, params, print_result=FALSE)
      
      vect <-get_specific_media(json_result)
      noRetweet1[x,"media_type"]<-vect[[1]]
      noRetweet1[x,"media_tech"]<-vect[[2]]
      #noRetweet1[x, "media_tech"]<-vect[[3]]
      
      Sys.sleep(2)
      
    }
    
    
    
  }


# id 
# 6.699801e+17 
# id 
# 6.706902e+17 
# id 
# 6.708997e+17 
# id 
# 6.717105e+17 
# id 
# 6.717168e+17 
#   

# 684972474132480000 photo jpg
#664907296523202560 video mp4