#searching through the list for classification 


library('stringi')
library('rjson')
library('jsonlite')
library('stringr')


  return_media_info<-function(result){
    jjj=fromJSON(result)
    
  #  list_result<-str_c(result)
#entities_list<- list_result['entities']


media_url<- tryCatch({
  jjjd<-jjj$entities$media
  jjjd[[1]]$media_url
  #list_result$entities$media$media_url
}, warning = function(w){
  #nothing in warning
}, error = function(e){
   return(NA)
}, finally = {
  #nothing in finally
}
)
print("media url is:")
print(media_url)

#help taken from Dirk Eddelbuettel on Stack Overflow
vect<-vector(mode="list", length=3)
names(vect)<-c("has_media", "media_type", "media_tech")


if(is.na(media_url) || is.null(media_url)){
  vect[[1]]<-FALSE
  vect[[2]]<-NA
  vect[[3]]<-NA
  return(vect)
}else{ #string for media
  #break up the string
  url_length<- stri_length(media_url)
  media_ending<-substr(media_url, url_length-6, url_length)
  
  
  #test all the possibilities!!!
  vect[[1]]<- TRUE
  if(grepl("jpg",media_ending)){
    vect[[2]]<-"photo"
    vect[[3]]<-"jpg"
  }else if(grepl("mp4",media_ending)) {
    vect[[2]]<-"video"
    vect[[3]]<-"mp4"
  }else if(grepl("png",media_ending)){
    vect[[2]]<-"photo"
    vect[[3]]<-"png"
  }else{
    vect[[2]]<-"NONE"
    vect[[3]]<-"NONE"
  }
  
  return(vect)
  
}#3 more columns => has_media, media_type, media_tech
  }
  
  
  #check whether or not this function works, then basically, do this and then do the For loop
  # afterwards, do a new column, for loop through the column, and hten 





