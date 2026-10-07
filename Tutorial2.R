library(tidyverse)

if (!file.exists("video_view.csv")) {
  data_url <- paste0(
    "https://raw.githubusercontent.com/hannesdatta/",
    "course-dprep/refs/heads/main/material/tutorials/r-bootcamp-rev/",
    "video_view.csv"
  )
  download.file(data_url, "video_view.csv")
}

videos <- read_csv("video_view.csv")

head(videos)
str(videos)
summary(videos)
nrow(videos)
names(videos)


exercise <- videos %>%
  mutate(
    engagement = watched_n / impressions_n 
  ) %>%
  group_by(creator_id) %>%
  summarise(
    mean_engagement = mean(engagement, na.rm = TRUE)
  ) %>%
  arrange(desc(mean_engagement))

