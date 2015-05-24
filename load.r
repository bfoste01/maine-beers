# load the data into r from the most recent web crawl
#   note. the `collapse` command to clean up the JSON irregularities from crawl
library(jsonlite)
beer.json = fromJSON(paste("[",paste(readLines("/Users/jazzfingers19/beer-advocate/beers-5-16-15.json"),collapse=","),"]"))
# convert list to df 
df <- as.data.frame(beer.json)
