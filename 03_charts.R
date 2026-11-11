setwd("/Users/areejbahar/Desktop/Bank churn analysis")

library(tidyverse)

clean <- read_csv("data/clean_churn.csv") |>
  mutate(age_group = factor(age_group,
                            levels = c("under 30", "30-39", "40-49", "50-59", "60+")))

dir.create("outputs", showWarnings = FALSE)

# Chart 1: churn by number of products
clean |>
  group_by(num_of_products) |>
  summarise(churn_rate = mean(exited) * 100) |>
  ggplot(aes(factor(num_of_products), churn_rate)) +
  geom_col(fill = "#2c7fb8") +
  geom_text(aes(label = paste0(round(churn_rate, 1), "%")), vjust = -0.4) +
  labs(title = "Churn is lowest at 2 products and extreme at 3+",
       x = "Number of bank products", y = "Churn rate (%)") +
  theme_minimal(base_size = 13)
ggsave("outputs/churn_by_products.png", width = 7, height = 4.5, dpi = 150)

# Chart 2: active vs inactive members
clean |>
  mutate(member = if_else(is_active_member == 1, "Active", "Inactive")) |>
  group_by(member) |>
  summarise(churn_rate = mean(exited) * 100) |>
  ggplot(aes(member, churn_rate)) +
  geom_col(fill = "#2c7fb8") +
  geom_text(aes(label = paste0(round(churn_rate, 1), "%")), vjust = -0.4) +
  labs(title = "Inactive members leave at nearly twice the rate",
       x = NULL, y = "Churn rate (%)") +
  theme_minimal(base_size = 13)
ggsave("outputs/churn_by_activity.png", width = 7, height = 4.5, dpi = 150)

# Chart 3: churn by age group
clean |>
  group_by(age_group) |>
  summarise(churn_rate = mean(exited) * 100) |>
  ggplot(aes(age_group, churn_rate)) +
  geom_col(fill = "#2c7fb8") +
  geom_text(aes(label = paste0(round(churn_rate, 1), "%")), vjust = -0.4) +
  labs(title = "Customers aged 40-59 are the most likely to leave",
       x = "Age group", y = "Churn rate (%)") +
  theme_minimal(base_size = 13)
ggsave("outputs/churn_by_age.png", width = 7, height = 4.5, dpi = 150)