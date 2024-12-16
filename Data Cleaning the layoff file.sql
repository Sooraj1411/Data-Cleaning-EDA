CREATE DATABASE world_layoff;

USE world_layoff;


-- Data Cleanig

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values and Blank Values
-- 4. Remove Any Column

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * FROM layoffs;

SELECT *
FROM layoffs_staging;

-- 1. REMOVING DUPLICATE ROWS :)
SELECT *,
ROW_NUMBER() OVER (PARTITION BY  company,location, industry, 
total_laid_off, percentage_laid_off,`date`, stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY  company,location, industry, 
total_laid_off, percentage_laid_off,`date`, stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * FROM duplicate_cte WHERE row_num > 1;

SELECT * FROM layoffs_staging
WHERE company = "Casper";

-- NOTE - WE CAN'T DELETE ROWS BASED ON ROW_NUM() SO WE ARE CREATING ANOTHER TABLE AND WE WILL DELETE DUPLICATES FROM THERE

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM `layoffs_staging2`;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER (PARTITION BY  company,location, industry, 
total_laid_off, percentage_laid_off,`date`, stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;


SELECT * FROM layoffs_staging2
WHERE row_num > 1;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

SELECT * FROM layoffs_staging2;

-- 2. STANDARDIZING THE DATA :)

SELECT company, TRIM(company) FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry FROM layoffs_staging2 ORDER BY 1;

SELECT * FROM layoffs_staging2
WHERE industry LIKE "CRYPTO%";

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE "CRYPTO%";


SELECT * FROM layoffs_staging2;

SELECT DISTINCT location FROM layoffs_staging2 ORDER BY 1;
SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;

SELECT * FROM layoffs_staging2
WHERE country LIKE "United States%";

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE "United States%";

SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;


SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT * FROM layoffs_staging2;


-- 3. NULL VALUES AND BLANK COLUMNS :)

SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * FROM layoffs_staging2
WHERE industry IS NULL
OR industry = "";

SELECT * FROM layoffs_staging2
WHERE company = "Airbnb";

UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = '';

SELECT t1.industry I1,t2.industry I2
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT * FROM layoffs_staging2;

-- 4 REMOVING THE COLUMN :)

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2;
