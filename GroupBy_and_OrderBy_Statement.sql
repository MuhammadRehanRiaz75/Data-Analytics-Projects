Select gender,avg(age) 
from parks_and_recreation.employee_demographics
group by gender;

Select gender,avg(age),max(age),min(age),count(age)
from parks_and_recreation.employee_demographics
group by gender;

Select *
from parks_and_recreation.employee_demographics
order by first_name;

Select *
from parks_and_recreation.employee_demographics
order by first_name desc;

Select *
from parks_and_recreation.employee_demographics
order by gender,age;

Select *
from parks_and_recreation.employee_demographics
order by gender desc,age desc;

Select *
from parks_and_recreation.employee_demographics
order by 5,4;

Select *
from parks_and_recreation.employee_demographics
order by birth_date;

Select occupation,avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager'
group by occupation
order by avg(salary) desc;