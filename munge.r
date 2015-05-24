# Select Out Data of Interest & Quick Munging
library(dplyr)
me.beers <- filter(df, brewery == "Maine Beer Company" | brewery == "Rising Tide Brewing Company" |
  brewery == "Allagash Brewing Company" | brewery == "Baxter Brewing Co." | brewery == "Oxbow Brewing Company" | 
  brewery == "Shipyard Brewing Co." | brewery == "Sebago Brewing Company" | brewery == "D.L. Geary Brewing Company" | 
  brewery == "Gritty McDuff's Brewing Company" | brewery == "Bar Harbor Brewing Company")
# check for duplicates and remove
duplicated(me.beers)
me.beers.2 <- me.beers[!duplicated(me.beers), ]
me.beers.2$rAvg <- as.numeric(as.character(me.beers.2$rAvg))
me.beers.2$num_reviews <- as.numeric(as.character(me.beers.2$num_reviews))
me.beers.2 <- filter(me.beers.2, num_reviews > 10)

