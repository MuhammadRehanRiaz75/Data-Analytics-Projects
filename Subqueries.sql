# Subquery is basically a query within another query
Select * from employee_demographics
where employee_id in
					(Select employee_id from employee_salary
                    where dept_id=1)
;

Select first_name,salary,
						(Select avg(salary) from employee_salary) as Avg_Salary
from employee_salary;

Select gender,avg(age) as Avg_Age,max(age) as Max_Age,min(age) as Min_Age,count(age) as Number
from employee_demographics
Group By gender;

Select avg(Max_Age) from(
				Select gender,avg(age) as Avg_Age,max(age) as Max_Age,min(age) as Min_Age,count(age) as Number
				from employee_demographics
				Group By gender) as Gender_Table
;

