
Premier League Match Analysis

This project analyzes the relationship between **match attendance** and **match outcomes** from the English Premier League 2022/23 season to the ongoing 2024/2025 using real match data. It also explores the relationship between **expected goals (xG)** and actual performance.

---

## Dataset
- File: `PremierLeagueMatches.csv`
- Source: Kaggle
- Includes match results, attendance, expected goals, and team info.

---

## Tools Used
- **R** (Data Analysis & Visualization)
  - `dplyr`
  - `ggplot2`
  - `readr`
- **RMarkdown** for reporting

---

## Analysis Objectives
- Does **home crowd attendance** impact match outcomes?
- How closely do teams perform to their **expected goals (xG)**?
- Are matches with **higher attendance** more likely to end in wins?
- Is there a relationship between **attendance and total goals**?

---

## Key Findings
- Home wins occurred with moderate attendance, but Draws had the highest average attendance, suggesting that higher-profile or unpredictable matches may attract larger crowds.
- Draws were more likely with higher attendance, indicating that close or balanced matches tend to attract more fans.
- A positive correlation was found between homeXG and actual homeScore, showing that expected goals is a reliable predictor of team performance.
- Higher attendance often correlates with higher variability in total goals, suggesting that crowd energy might impact scoring, but further analysis is required to confirm this.

---
 Summary Table
"Result_Label","Avg_Attendance","Avg_HomeXG","Avg_AwayXG","Avg_Goals"
"Away Win",NA,1.15,1.81,3.12
"Draw",NA,1.51,1.27,2.45
"Home Win",NA,2.02,0.99,3.3
NA,NA,NA,NA,NA

*(Table generated using dplyr + write.csv())*

---

## About Me
This project was created by **Elisha Macalalad**, a Business Analytics student at Monash University. Built as part of a learning journey into sports analytics using real-world football data.

https://github.com/elishamacalalad
elishakmacalalad@gmail.com

---

## Project Structure

```
📁 epl-attendance-analysis/
├── PremierLeagueMatches.csv
├── epl_analysis.R
├── attendance_by_result.png
├── xg_plot.png
├── summary_table.csv
├── attendance_report.Rmd
└── README.md
```

---

*This project is for educational purposes and not affiliated with the EPL or any official organization.*
