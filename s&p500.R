library(robotstxt)
library(rvest)
library(stringr)
library(tidyverse)
url="https://stooq.com/q/d/?s=^spx&i=d"
paths_allowed(url)
page <- read_html(url)
close <-page %>%
  html_nodes("#f13 tr td:nth-child(6)") %>%
  html_text()
date <-page %>%
  html_nodes("#t03+ td")%>%
  html_text()
url2="https://stooq.com/q/d/?s=^spx&i=d&l=2"
paths_allowed(url2)
page2 <- read_html(url2)
date2 <-page2 %>%
  html_nodes("#t03+ td")%>%
  html_text()
close2 <-page2 %>%
  html_nodes("#f13 tr td:nth-child(6)") %>%
  html_text()
close<-c(close,close2)
date<-c(date,date2)
close<-as.numeric(close)
date<-str_replace_all(date," ","-")
url3="https://www.investing.com/indices/us-spx-500-historical-data"
paths_allowed(url3)
sp500 <- tibble(date = date, close= close)
str(sp500,"Courier New")
write.table(sp500,"C:/Users/lcb/Desktop/Msc/data analysis skills/Data.xls",sep = "\t",eol="\r",quote = FALSE,row.names = FALSE)
