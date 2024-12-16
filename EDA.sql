-- EDA(EXPLORATORY DATA ANALYSIS)

SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off),MAX(percentage_laid_off) FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT industry, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;

SELECT stage, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;

SELECT MIN(`Date`),MAX(`Date`) FROM layoffs_staging2;        -- MARCH 2020 - MARCH 2023 --> 3 YEARS DATA

SELECT YEAR(`date`), SUM(total_laid_off) FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;

SELECT * FROM layoffs_staging2;

SELECT SUBSTR(`Date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE SUBSTR(`Date`,1,7) IS NOT NULL
GROUP BY 1 ORDER BY 1;


WITH Rolling_total AS (
	SELECT SUBSTR(`Date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_laid_off
	FROM layoffs_staging2
	WHERE SUBSTR(`Date`,1,7) IS NOT NULL
	GROUP BY 1 ORDER BY 1)

SELECT `MONTH`, total_laid_off, SUM(total_laid_off) OVER(ORDER BY `MONTH`) AS Rolling_Total FROM Rolling_total;


SELECT company, YEAR(`Date`) , SUM(total_laid_off) FROM layoffs_staging2
GROUP BY 1,2 ORDER BY 3 DESC;

WITH RankingCompanyYearly (company,years,laid_offs) AS(
	SELECT company, YEAR(`Date`) , SUM(total_laid_off) FROM layoffs_staging2
	GROUP BY 1,2),
CompanyRanking AS(    
	SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY laid_offs DESC) AS `rank` FROM RankingCompanyYearly
	WHERE years IS NOT NULL ORDER BY `rank`
) 
SELECT * FROM CompanyRanking WHERE `rank` <= 5;
