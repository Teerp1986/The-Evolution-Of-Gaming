

# Evolution Of Gaming
<p align="center">
  <img src="Visuals- Charts_mysql\Gaming Revinue Pic.png" width="600">
</p>


## Overview
This project analyzes the video‑game industry to uncover long‑term patterns in global sales, profitability, release trends, genre popularity, and company performance. Video games have shaped global entertainment for over 50 years, influencing culture, technology, and the economy. By examining industry data, this project highlights how gaming continues to evolve and what factors drive success in a competitive market.

The analysis combines SQL exploration, Python‑based data visualization, and cleaned CSV workflows to reveal meaningful insights into platform dominance, genre performance, and global sales behavior across decades.

### Insights & Analytical Focus
The project uses structured database queries and polished visualizations to uncover:
- Shifts in platform and console dominance.
- Genre‑level performance and global sales trends
- Regional differences in gaming markets
- Decade‑by‑decade changes in consumer preferences
- Company‑level performance and long‑term market impact

## Data Visualization

### My Visualization Goals
The visualizations support three core analytical goals:

- Identify high‑level trends (platform popularity, regional sales patterns, decade shifts)
- Compare categories (genres, publishers, platforms, device types)
- Reveal relationships (scatter plots, line charts, correlations)

### Visualization Types Included
- Global Highest‑Grossing Genre (2020) — Vertical Bar Chart
- Top 10 Highest‑Grossing Game Companies — Horizontal Bar Chart
- Top 10 Regional Console Sales (2020) — Stacked Bar Chart
- Top 10 Global Console Sales (2020) — Line Plot
- Lowest Gaming Revenue by Region (2020) — Pie Chart
- Top 10 Console Companies by Units Sold (since 1980) — Horizontal Bar Chart
- Most Popular Console Types by Decade — Histogram


### Custom Python Utilities
#### The project includes several reusable helper functions:

    1. validate_columns()
- Stops your workflow from breaking mid‑analysis
- Gives clean, readable error messages
- Perfect for reproducible pipeline

        2. load_sql_to_df()
- Run SQL and return a clean DataFrame. 
- This is a  reusable function that keeps your notebook clean and eliminates repeated boilerplate.

        3. Quickly profile missing data
- Instantly see which columns need cleaning.



## CSV‑Based Workflow Overview
This project can run entirely from CSV files without MySQL. The workflow includes four major steps:

    1. Set up your environment (Python, virtual environment, dependencies).
    2. Organize your project folder so notebooks and CSVs load cleanly.
    3. Load CSVs into pandas instead of querying MySQL.
    4. Run your analysis + visualizations exactly as before.


    1. Environment Setup on Windows 11
- Install Python
Download from: https://www.python.org/downloads/windows/  
During installation, enable: “Add Python to PATH”

- Create a virtual environment
Open Windows Terminal or PowerShell:
cd path\to\EvolutionOfGaming
python -m venv
venv\Scripts\activate

- Install Dependencies
pip install pandas matplotlib seaborn numpy jupyter

- Use the notebook named "gamevolve_csv_version.ipynb". This project version is coded to use csv files.files.

    2. Load CSV Files Instead of SQL

- Inside your notebook (evolution.ipynb):

import pandas as pd

df = pd.read_csv("../Data/dagevolve_full.csv")
df_consoles = pd.read_csv("../Data/gameconsoles.csv")
df_sales = pd.read_csv("../Data/gamesales.csv")

- If you encounter path issues
Use a full path:
file_path = r"C:\Users\Tonika Price\Source\Repos\EvolutionOfGaming\Data\Dagevolve_full.csv"
df = pd.read_csv(file_path)

- If encoding errors occur
df = pd.read_csv("../Data/dagevolve_full.csv", encoding="latin1") 


    3. Replace SQL Queries with Pandas Equivalents
- SQL GROUP BY → pandas groupby

SELECT Genre, SUM(Global_Sales)
FROM dagevolve_full
GROUP BY Genre;

- PYTHON
genre_sales = df.groupby("Genre")["Global_Sales"].sum()

- Decade Grouping
df_consoles["Decade"] = pd.cut(
    df_consoles["Year"],
    bins=[1990, 1999, 2009, 2019, 2029],
    labels=["1990s", "2000s", "2010s", "2020s"]
)

- Pivot Table
pivot_df = df_consoles.pivot_table(
    index="Decade",
    columns="Type",
    values="Type",
    aggfunc="count",
    fill_value=0
)


    4. Run All Visualizations Normally
- Your existing visualization code works unchanged:
python
import matplotlib.pyplot as plt

plt.figure(figsize=(12,6))
plt.bar(genre_sales.index, genre_sales.values)
plt.xticks(rotation=45)
plt.show()

As long as DataFrame names match, all charts run seamlessly.

    5. Run the Notebook
jupyter notebook
- Open:
notebooks/dagevolve.ipynb

- Optional: Clean & Validate CSV Data
Strip column names, remove duplicates, fill missing values
python
df.columns = df.columns.str.strip()
df = df.drop_duplicates()
df = df.fillna(0)

- To convert numeric columns:
df["Global_Sales"] = pd.to_numeric(df["Global_Sales"], errors="coerce") 

- Ready to Run the Full Project
Now have a complete CSV‑based workflow that:
    • avoids MySQL entirely
    • keeps your analysis reproducible
    • works perfectly on Windows 11
    • integrates smoothly with your existing visualizations
