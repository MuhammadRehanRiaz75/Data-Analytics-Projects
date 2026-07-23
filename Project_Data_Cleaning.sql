Select * from layoffs;

Create table layoffs_staging
like layoffs;

Select * from layoffs_staging;

Insert layoffs_staging
Select * from layoffs;

Select distinct(country) from layoffs_staging;

# 1. Remove Duplicates
# 2. Standardize the Data
# 3. Null values or blank values
# 4. Remove any columns

Select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions
) as row_num
from layoffs_staging order by company;

With duplicate_cte as(
Select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions
) as row_num
from layoffs_staging)
Select * from duplicate_cte where row_num>1;

Select * from layoffs_staging where company='Casper';


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
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Insert into layoffs_staging2
Select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions
) as row_num
from layoffs_staging;

Select * from layoffs_staging2 where row_num>1;
SET SQL_SAFE_UPDATES = 0;
Delete from layoffs_staging2 where row_num>1;

Select distinct company from layoffs_staging2;

update layoffs_staging2
set company=trim(company);

Select distinct industry from layoffs_staging2 order by industry;

Select * from layoffs_staging2 where industry LIKE 'Crypto%';

update layoffs_staging2
set industry='Crypto'
where industry like 'Crypto%';

Select distinct country from layoffs_staging2 order by 1;

Select * from layoffs_staging2 where country LIKE 'United States%';

update layoffs_staging2
set country='United States'
where country like 'United States%';

Select distinct country,trim(Trailing '.' From country)
from layoffs_staging2 order by 1;

Select `date`,str_to_date(`date`,'%m/%d/%Y') from layoffs_staging2;

Update layoffs_staging2
set `date`=str_to_date(`date`,'%m/%d/%Y');

Select `date` from layoffs_staging2;

Alter table layoffs_staging2
modify column `date` date;

Select * from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

Select distinct industry from layoffs_staging2;

Select * from layoffs_staging2
where industry is null
or industry='';

Select * from layoffs_staging2
where company like 'Airbnb%';

Select * from 
layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;

update layoffs_staging2
set industry=NULL
where industry='';

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null
and t2.industry is not null;

Select * from layoffs_staging2
where company like 'Bally%';

Delete from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

Alter table layoffs_staging2
drop column row_num;

