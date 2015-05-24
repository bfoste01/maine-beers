# Best Maine Beers
#
# Some Fun Plotting
#
# is there any relationship between the number of reviews and rating?
# not surprising that Allagash dominates in terms of popularity and rating while Shipyard/Sebago are popular but terrible
brew.med <- median(me.beers.2$num_reviews)
library(ggplot2)
p1 <- ggplot(me.beers.2, aes(rAvg, num_reviews))
p1 + geom_point(aes(colour = factor(brewery), position = "jitter"), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("Number of Reviews") + 
  ggtitle("Reviews and Ratings for Popular Maine Breweries") + 
  guides(color=guide_legend(title="Breweries")) +
  geom_hline(yintercept = brew.med) # median number of reviews
# examining the best hoppy styles
hop.me <- filter(me.beers.2, style_id == 150 | style_id == 140 | style_id == 97 | style_id == 116 |
  style_id == 154 | style_id == 128)
hop.med <- median(hop.me$num_reviews)
p2 <- ggplot(hop.me, aes(rAvg, num_reviews))
p2 + geom_point(aes(colour = factor(style)), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("Number of Reviews") + 
  ggtitle("Reviews and Ratings for Hoppy Maine Beers") + 
  guides(color=guide_legend(title="Styles")) + 
  geom_text(aes(label=ifelse(rAvg > 4, as.character(name), ''),colour=factor(style)), hjust=1.2, vjust=0, , angle = 10) + 
  geom_hline(yintercept = hop.med)
# examining the worst hoppy styles
p3 <- ggplot(hop.me, aes(rAvg, num_reviews))
p3 + geom_point(aes(colour = factor(style)), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("Number of Reviews") + 
  ggtitle("Reviews and Ratings for Hoppy Maine Beers") + 
  guides(color=guide_legend(title="Styles")) + 
  geom_text(aes(label=ifelse(rAvg < 3, as.character(name), '')), hjust=1.2, just=1.2) + 
  geom_hline(yintercept = hop.med)
# examining abv by rating
p4 <- ggplot(me.beers.2, aes(rAvg, abv))
p4 + geom_point(aes(colour = num_reviews), size = 3) + 
  xlab("Beer Ratings") + 
  ylab("ABV") + 
  ggtitle("ABV by Review") + 
  guides(color=guide_legend(title="Number of Reviews")) 


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