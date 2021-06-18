library(robotstxt)
library(rvest)
library(stringr)
library(tidyverse)
paths_allowed("https://www.imdb.com/")
page<-read_html("https://www.imdb.com/chart/top")
title<-page %>%
  html_nodes(".titleColumn a") %>%
  html_text()
title
year<-page%>%
  html_nodes(".secondaryInfo") %>%
  html_text()%>%
  str_remove("\\(")%>%
  str_remove("\\)")%>%
  as.numeric()

rate<-page%>%
  html_nodes("strong")%>%
  html_text()%>%
  as.numeric()
imdb_top_250 <-tibble(
  title=title,
  year=year,
  rating=rate)
imdb_top_250
)

