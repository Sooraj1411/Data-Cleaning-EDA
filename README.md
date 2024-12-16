# **DATA ANALYSIS ON LAYOFFS DATA (MARCH 2020 - MARCH 2023)**
bhcd
## *Overview*
- The following dataset contaion information about the layoffs across various industries across the globe from March 2020 - March 2023.
- This project mainly focuses on Data Cleaning, EDA(Exploratory Data Analysis) and extracting actionable insights.
- I personally did this project as I was keen to analyze the impact of COVID-19 on different Industry Sectors.

## *Dataset Information*
_Link to dataset_ - [Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022) <br>
<br>
_*COLUMNS/FIELDS in Dataset :*_ <br>
<br>
      1. Comapny - The Comapny Name.<br>
      2. Location - The City where the Comapny is located.<br>
      3. Industry - The Industry to which the Comapny belongs to.<br>
      4. total_laid_off - Total number of employees who were laid off by Company on a particular day at the particular location.<br>
      5. percentage_laid_off - Proportion of employees laid off in relation to the total workforce of a Company.<br>
      6. Date - The date when the Company laid off employees.<br>
      7. stage - Lifecycle stage of a company.<br>
      8. Country - The Countries where the Company is situated in.<br>
      9. funds_raised_millions - Funds raised by the Company in Millions.<br>


## *Project Goals*

- Cleaning and preprocessing raw data for analysis.
- Analyzing layoff trends over the three-year period.
- Identifying the industries or locations most affected by layoffs.
- Detecting seasonal trends or anomalies in layoffs.


## *Steps Performed*
_Outline the key steps I followed in this Project:_ <br>

1. **Data Cleaning :** <br>
 (a). Remove Duplicates<br>
 (b). Standardize the Data<br>
 (c). Null Values and Blank Values<br>
 (d). Remove Any Column<br>

2. **Exploratory Data Analysis(EDA) :** <br>
 (a). Analyzed companies with a layoff percentage of 100%, indicating they laid off their entire workforce.<br>
 (b). Identified companies, industries, countries, and stages with the highest number of layoffs.<br>
 (c). Analyzed specific months or years with the highest number of layoffs using rolling totals.<br>
 (d). Analyzed layoff trends during specific COVID-19 waves.<br>

3. **INSIGHTS :** <br>
   (a). Out of almost 2000 companies, more that 100 companies laid off their entire workforce.<br>
   (b). Over the course of 3 years,In companies, industries, stages, countries -> Amazon, Consumer, Post-IPO and United States had the most laid offs.<br>
   (c).The year 2022 saw the highest number of layoffs, with over 160k employees laid off.<br>
   (d). Google had the most layoffs (12k) at once in January 2021.<br>
   (e). Despite only having data for three months of 2023, the year already had the second-highest number of layoffs, with more than 125k employees. This indicates that 2023 is likely to surpass 2022 in total layoffs.<br>


## *Tools Used*
- Used Microsoft Excel for validating the data.
- Used SQL for Data Cleaning & EDA.
- Platform - MySQL.

  ## *How to Use :*
 Include instructions for someone who wants to replicate your work: <br>
 - Download the [layoffs.csv](https://github.com/Sooraj1411/Data-Cleaning-EDA/blob/main/layoffs.csv) file provided in the project.
 - Import the data in MySQL after creating a database.
 - Run the [Data Cleaning Queries](https://github.com/Sooraj1411/Data-Cleaning-EDA/blob/main/Data%20Cleaning%20the%20layoff%20file.sql) and then [EDA](https://github.com/Sooraj1411/Data-Cleaning-EDA/blob/main/EDA.sql) queries to get desired outputs.

## *Contact :*
For any questions or feedback, please reach out to [suraj783856@gmail.com](mailto:suraj783856@gmail.com).
