Select * From parks_and_recreation.employee_demographics;

Select first_name,
last_name,
birth_date,
age,
(age+10)*10+10
from parks_and_recreation.employee_demographics;
# SQL Follows PEMDAS Rule For Arithmetic Operations

Select distinct gender from parks_and_recreation.employee_demographics;

Select distinct first_name,gender from parks_and_recreation.employee_demographics;

