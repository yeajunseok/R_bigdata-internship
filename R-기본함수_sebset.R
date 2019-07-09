### R-기본함수_subset
library(ggplot2)
head(diamonds)
     
subset(diamonds, cut == "Premium")
subset(diamonds, cut == c('Premium', 'Fair'))
subset(diamonds, cut == 'Premium' | color=='E')
subset(diamonds, cut == 'Premium' & color=='E')
subset(diamonds, cut == 'Premium' & color=='E', select = clarity) # select로 지정한 열만 반환
subset(diamonds, cut == 'Premium' & color=='E', select = c(clarity, price))
subset(diamonds, cut == 'Premium' & color=='E', select = clarity:price)
