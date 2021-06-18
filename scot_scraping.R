url_jd="https://www.nomisweb.co.uk/reports/lmp/la/1946157420/subreports/jd_time_series/report.aspx?"
page_jd <- read_html(url_jd)
job_density<-page_jd %>%
     html_nodes(".datatablecell:nth-child(4)") %>%
     html_text() %>%
     as.numeric()
url_hp="https://www.nomisweb.co.uk/reports/lmp/la/1946157420/subreports/asher_time_series/report.aspx?"
