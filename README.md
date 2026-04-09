![alt text](image.png)

# Evolution Of Gaming

## This project analyzes the video game industry to uncover patterns in game sales, profitability, release trends, genre popularity, and company performance over time. I selected this dataset because video games have been a personal passion since childhood, and the industry itself has significantly shaped global entertainment, created employment opportunities, and generated major economic impact for over 50 years. By examining industry data, the project aims to better understand how gaming continues to evolve and what factors drive success in this highly competitive market.

### The visualizations and SQL exploration in this project reveal several meaningful patterns about the evolution of the gaming industry. By combining structured database queries with polished analytical charts, the project uncovers trends in platform dominance, genre performance, and global sales behavior across decades. These findings form the narrative backbone of the analysis and highlight how the industry has shifted in response to technology, consumer preferences, and market expansion.

### Data Visualization
This project includes a series of visualizations designed to highlight trends, comparisons, and patterns within the global video‑game market. Each chart is generated from the cleaned MySQL dataset and follows a consistent visual style to support clarity, accessibility, and presentation‑ready storytelling.

### Visualization Goals
The visualizations in this project are built to support three core analytical goals:

- Identify high‑level trends such as platform popularity, regional sales patterns, and decade‑level shifts.
- Compare categories including genres, publishers, platforms, and device types.
- Reveal relationships through scatter plots, line charts, and correlation‑based visuals.
These visuals form the analytical backbone of the project, helping translate raw data into insights that are easy to interpret and present.

### Visualization Types Included
The project uses a diverse set of chart types to communicate different aspects of the data effectively:

- Global Highest Grossing Genre as of 2020 - Verticle Bar Chart

- Top 10 Highest Grossing Game Companies Globally - Horizontal Bar Chart

- Top 10 Region Consoles Sales as of 2020 - Stacked Bar Chart

- Top 10 Global Console Sales as of 2020 - Line Plot Chart

- Lowest Gaming Revenue by Region through 2020 - Pie Chart

- Top 10 Console Companies by Units Sold since 1980" - Horizontal Bar Chart

- Most Popular Console Types by Decade - Histograph

Each visualization is designed with consistent formatting, color harmony, and readability in mind.




### Overview of the Workflow
Running the project from CSV involves four major steps:

    1. Set up your environment (Python, virtual environment, dependencies).
    2. Organize your project folder so notebooks and CSVs load cleanly.
    3. Load CSVs into pandas instead of querying MySQL.
    4. Run your analysis + visualizations exactly as before.


    1. Environment Setup on Windows 11
Install Python (if not installed)
Download from: https://www.python.org/downloads/windows/
During installation:
• Check “Add Python to PATH”
Create a virtual environment

Open Windows Terminal or PowerShell:
cd path\to\EvolutionOfGaming
python -m venv
venv\Scripts\activate

pip install pandas matplotlib seaborn numpy jupyter




    2. Load CSV Files Instead of SQL
Inside your notebook (evolution.ipynb):

import pandas as pd

df = pd.read_csv("../Data/dagevolve_full.csv")
df_consoles = pd.read_csv("../Data/gameconsoles.csv")
df_sales = pd.read_csv("../Data/vgsales.csv")

If your CSVs have encoding issues:
df = pd.read_csv("../Data/dagevolve_full.csv", encoding="latin1") 


    3. Replace SQL Queries with Pandas Equivalents
Example: SQL GROUP BY → pandas groupby
SQL version:

SELECT Genre, SUM(Global_Sales)
FROM dagevolve_full
GROUP BY Genre;

genre_sales = df.groupby("Genre")["Global_Sales"].sum()

decade grouping
df_consoles["Decade"] = pd.cut(
    df_consoles["Year"],
    bins=[1990, 1999, 2009, 2019, 2029],
    labels=["1990s", "2000s", "2010s", "2020s"]
)

pivot table
pivot_df = df_consoles.pivot_table(
    index="Decade",
    columns="Type",
    values="Type",
    aggfunc="count",
    fill_value=0
)


    4. Run All Visualizations Normally
All your charts—bar charts, stacked bars, pie charts, decade trends—work exactly the same.##

Example:
import matplotlib.pyplot as plt

plt.figure(figsize=(12,6))
plt.bar(genre_sales.index, genre_sales.values)
plt.xticks(rotation=45)
plt.show()

Your existing visualization code can be reused with zero changes as long as the DataFrame names match.

    5. Run the Notebook
jupyter notebook
notebooks/dagevolve.ipynb


Optional: Clean and Validate CSV Data
The CSVs came from MySQL exports, you may need:
df.columns = df.columns.str.strip() df = df.drop_duplicates() df = df.fillna(0) 

To convert numeric columns:
df["Global_Sales"] = pd.to_numeric(df["Global_Sales"], errors="coerce") 

    Ready to Run the Full Project
You  have a complete CSV‑based workflow that:
    • avoids MySQL entirely
    • keeps your analysis reproducible
    • works perfectly on Windows 11
    • integrates smoothly with your existing visualizations
