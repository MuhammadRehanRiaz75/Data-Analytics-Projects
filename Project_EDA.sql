# Exploratory Data Analysis
Select * from layoffs_staging2;

Select max(total_laid_off),max(percentage_laid_off) from layoffs_staging2;

Select * from layoffs_staging2 where
percentage_laid_off=1 order by total_laid_off desc;

Select * from layoffs_staging2 where
percentage_laid_off=1 order by funds_raised_millions desc;

Select company,sum(total_laid_off) from layoffs_staging2
group by company
order by 2 desc;

Select min(`date`),max(`date`) from layoffs_staging2;

Select industry,sum(total_laid_off) from layoffs_staging2
group by industry
order by 2 desc;

Select country,sum(total_laid_off) from layoffs_staging2
group by country
order by 2 desc;

Select Year(`date`),sum(total_laid_off) from layoffs_staging2
group by Year(`date`)
order by 1 desc;

Select stage,sum(total_laid_off) from layoffs_staging2
group by stage
order by 2 desc;

Select substring(`date`,1,7) as `Month`,sum(total_laid_off) from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1;

With rolling_total as
(Select substring(`date`,1,7) as `Month`,sum(total_laid_off) as total_off from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1)
Select `Month`,total_off,sum(total_off)  
over(order by `Month`) as rolling_total
from rolling_total
;

Select company,Year(`date`),sum(total_laid_off) from layoffs_staging2
group by company,Year(`date`)
order by 3 desc;

With company_year(company,years,total_laid_off)
as
(Select company,Year(`date`),sum(total_laid_off) from layoffs_staging2
group by company,Year(`date`)
),company_year_rank
as
(select *,dense_rank()
over(partition by years order by total_laid_off desc) as ranking
from company_year where years is not null
)
Select * from company_year_rank
where ranking<=5
;

Select country,Year(`date`),sum(total_laid_off) from layoffs_staging2
group by country,Year(`date`)
order by 3 desc;

with country_year (country,years,total_laid_off) as
(Select country,Year(`date`),sum(total_laid_off) from layoffs_staging2
group by country,Year(`date`)),
country_year_rank as(
Select *,dense_rank()
over(partition by years order by total_laid_off desc) as ranking 
from country_year where Years is not null)
Select * from country_year_rank where ranking<=5;
