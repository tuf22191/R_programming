

#function if we know the twitter already has media
#searching through the list for classification 


library('stringi')
library('rjson')
library('jsonlite')
library('stringr')


get_specific_media<-function(result){
  jjj=fromJSON(result)
  

  #help taken from Dirk Eddelbuettel on Stack Overflow
  vect<-vector(mode="list", length=2)
  names(vect)<-c("media_type", "media_tech")
  
  
  ###We already know there is media, 
  ### Check to see if there is an 
 
  vect[[1]]<- jjj$extended_entities$media[[1]]$type  
  
  
  tech_ending <-""
    
  if(is.null(jjj$extended_entities$media[[1]]$video_info)){
    # if video_info is null, then there is no video
    #use the media url
    media_url_<-jjj$extended_entities$media[[1]]$media_url
    
    print("media url is:")
    print(media_url_)
    
    #string for media
    #break up the string
    url_length<- stri_length(media_url_)
    media_ending<-substr(media_url_, url_length-6, url_length)
    
    if(grepl("jpg",media_ending)){
      vect[[2]]<-"jpg"
    }else if(grepl("png",media_ending)){
      vect[[2]]<-"png"
    }
  }else{
    # it is video, therefore, get the format
    tech_ending<-jjj$extended_entities$media[[1]]$video_info$variants[[1]]$content_type
    #I think because there is a list of one object, using [1] gets the list, but using the [[1]] get the object in the list
  
    if(grepl("mp4",tech_ending)){
      vect[[2]]<-"mp4"
    }else if(grepl("wmv",tech_ending)){
      vect[[2]]<-"wmv"
    }
    
  }
  
    print(vect[[1]])
    print(vect[[2]])
  
  
    return(vect)
    
}


#check whether or not this function works, then basically, do this and then do the For loop
# afterwards, do a new column, for loop through the column, and hten 



#671716793195634688

