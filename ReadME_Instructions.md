How to Run this Project using cvs files:

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
python -m venv venv
venv\Scripts\activate

pip install pandas matplotlib seaborn numpy jupyter



2. Load CSV Files Instead of SQL
Inside your notebook (csv_version.ipynb):

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
All your charts—bar charts, stacked bars, pie charts, decade trends—work exactly the same.

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
