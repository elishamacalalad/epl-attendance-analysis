library(dplyr)
library(ggplot2)
library(readr)
install.packages("readr")
epl_data <- read_csv("PremierLeagueMatches.csv")
glimpse(epl_data)
epl_data <- epl_data %>% drop_na(Attendance)
epl_data <- epl_data %>%
  mutate(Attendance = as.numeric(gsub(",", "", Attendance)))
epl_data <- epl_data %>%
  mutate(Result_Label = case_when(
    Result == "H" ~ "Home Win",
    Result == "A" ~ "Away Win",
    Result == "D" ~ "Draw"
  ))

ggsave("attendance_by_result.png", width = 6, height = 4)
aov_result <- aov(Attendance ~ Result_Label, data = epl_data)
summary(aov_result)
TukeyHSD(aov_result)
epl_data <- epl_data %>%
  mutate(
    TotalGoals = homeScore + awayScore,
    HomeXG_Diff = homeScore - homeXG,
    AwayXG_Diff = awayScore - awayXG
  )
ggplot(epl_data, aes(x = homeXG, y = homeScore)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Home Team XG vs Actual Goals", x = "Expected Goals", y = "Actual Goals")
summary_table <- epl_data %>%
  group_by(Result_Label) %>%
  summarise(
    Avg_Attendance = round(mean(Attendance), 0),
    Avg_HomeXG = round(mean(homeXG), 2),
    Avg_AwayXG = round(mean(awayXG), 2),
    Avg_Goals = round(mean(TotalGoals), 2)
  )

print(summary_table)
write.csv(summary_table, "summary_table.csv", row.names = FALSE)
model <- lm(homeScore ~ homeXG, data = epl_data)
summary(model)
ggplot(epl_data, aes(x = homeXG, y = homeScore)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Home Team Expected Goals vs Actual Goals",
    x = "Expected Goals (xG)",
    y = "Actual Goals Scored"
  )