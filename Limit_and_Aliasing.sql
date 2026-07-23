Select *
from parks_and_recreation.employee_demographics
limit 3;

Select *
from parks_and_recreation.employee_demographics
order by age desc
limit 3;

Select *
from parks_and_recreation.employee_demographics
order by age desc
limit 2,1;

Select gender,avg(age) as avg_age
from parks_and_recreation.employee_demographics
group by gender
having avg_age>40;
