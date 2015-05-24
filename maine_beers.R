# Best Maine Beers
#
# Some Fun Plotting
#
# is there any relationship between the number of reviews and rating?
# not surprising that Allagash dominates in terms of popularity and rating while Shipyard is popular but terrible
library(ggplot2)
p1 <- ggplot(me.beers.2, aes(rAvg, num_reviews))
p1 + geom_point(aes(colour = factor(brewery), position = "jitter"), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("Number of Reviews") + 
  ggtitle("Reviews and Ratings for Popular Maine Breweries") + 
  guides(color=guide_legend(title="Breweries")) +
  geom_hline(yintercept = 57.5) 

me.beers.2 <- filter(me.beers.2, style == 10)
p2 <- ggplot(me.beers.2, aes(rAvg, num_reviews))
p2 + geom_point(aes(colour = factor(style)), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("Number of Reviews") + 
  ggtitle("Reviews and Ratings for Popular Maine Breweries") + 
  guides(color=guide_legend(title="Breweries"))
# best and worst beers
mt <- me.beers.2[order(me.beers.2$rAvg), ]
top.10 <- by(mt, mt["rAvg"], head, n=10)
top.10 <- data.frame(top.10)
Reduce(rbind, top.10)
me.beers.2[order(me.beers.2$rAvg,decreasing=T)[1:11],]
me.beers.2[order(me.beers.2$rAvg, me.beers.2$num_reviews, decreasing = T)[1:11],]
me.beers.2[with(me.beers.2, order(rAvg, num_reviews)),]
test <- me.beers.2[order(me.beers.2$rAvg, me.beers.2$num_reviews, me.beers.2$abv) , ]

arrange(me.beers.2, rAvg, num_reviews)

tbl_df(me.beers.2) %>%
  group_by(rAvg) %>%
  tally(G) %>%
  top_n(10)