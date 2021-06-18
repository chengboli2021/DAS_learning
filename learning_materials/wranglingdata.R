install.packages("fivethirtyeight")
# tidyverse core packages
library(tidyverse)

# packages containing interesting data
library(nycflights13)
library(fivethirtyeight)
dem_score<-read.csv("https://moderndive.com/data/dem_score.csv")
guat_dem<-dem_score %>%
  filter(country == "Guatemala")
guat_tidy <- gather(data = guat_dem, 
                    key = year,
                    value = democracy_score,
                    - country) 
guat_tidy
ggplot(guat_tidy,mapping = aes(x=parse_number(year) ,y=democracy_score))+
  geom_line()
dem_score_tidy <- gather(data = dem_score, 
                         key = year,
                         value = democracy_score,
                         -country) 
head(dem_score_tidy)



kids <- data.frame(age=c(4,11), weight=c(15,28), height=c(101,132), gender=c("f", "m"))
rownames(kids) <- c("Sarah", "John")
kids

library(tibble)
kidstibble <- as_tibble(kids)
kidstibble
kidstibble$name <- rownames(kids) # Create a column with names
kidstibble <- kidstibble[,c("name", "age", "weight", "height", "gender")]
# Re-arrange columns that names comes first
kidstibble2 <- rownames_to_column(kids)