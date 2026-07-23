Select gender,avg(salary) as Avg_Salary
from employee_demographics dem
join employee_salary sal on
		dem.employee_id=sal.employee_id
group by gender;

Select dem.first_name,dem.last_name,gender,avg(salary) over(Partition By gender)
from employee_demographics dem
join employee_salary sal on
		dem.employee_id=sal.employee_id
;

# Using Subquery
Select first_name,salary,
						(Select avg(salary) from employee_salary) as Avg_Salary
from employee_salary;

#Using Window Function
Select first_name,salary,avg(salary) over()
from employee_salary;

Select dem.first_name,dem.last_name,gender,dem.employee_id,salary,sum(salary) 
over(Partition By gender order by dem.employee_id) as Rolling_Total
from employee_demographics dem
join employee_salary sal on
		dem.employee_id=sal.employee_id
;

Select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
Row_Number() over(partition by gender order by salary desc)
from employee_demographics dem
join employee_salary sal on
		dem.employee_id=sal.employee_id
;

Select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
Row_Number() over(partition by gender order by salary desc) as RowNumber,
rank() over(partition by gender order by salary desc) as RankNumber,
dense_rank() over(partition by gender order by salary desc) as DenseNumber
from employee_demographics dem
join employee_salary sal on
		dem.employee_id=sal.employee_id
;