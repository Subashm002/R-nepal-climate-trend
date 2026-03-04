# Load libraries
library(readr)   # for reading CSV files
library(dplyr)   # for data cleaning
library(ggplot2) # for plotting

# Step 1: Import dataset
climate <- read_csv("data/climate-change_npl.csv")

# Step 2: Filter for one indicator (example: Agricultural land % of land area)
agri_land <- climate %>%
  filter(`Indicator Name` == "Agricultural land (% of land area)") %>%
  select(Year, Value)

# Step 3: Plot the trend
plot <- ggplot(agri_land, aes(x = Year, y = Value)) +
  geom_line(color = "darkgreen", size = 1) +
  labs(title = "Agricultural Land (% of Land Area) in Nepal",
       x = "Year", y = "Percentage of Land Area")

# Step 4: Save plot as PNG in results folder
ggsave("results/agri_land_trend.png", plot, width = 7, height = 5)

