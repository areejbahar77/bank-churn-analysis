setwd("/Users/areejbahar/Desktop/Bank churn analysis")

library(tidyverse)
library(janitor)

raw <- read_csv("data/Churn_Modelling.csv") |> clean_names()
glimpse(raw)

clean <- raw |>
  select(-row_number, -surname) |>
  mutate(age_group = cut(age,
                         breaks = c(0, 29, 39, 49, 59, 100),
                         labels = c("under 30", "30-39", "40-49", "50-59", "60+")))

# quick checks
nrow(clean)
table(clean$exited)
sum(is.na(clean))

write_csv(clean, "data/clean_churn.csv")