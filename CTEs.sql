# Using Common Table Expressions (CTE)
# A CTE allows you to define a subquery block that can be referenced within the main query. 
# It is particularly useful for recursive queries or queries that require referencing a higher level
With CTE_Example as
(
				Select gender,avg(salary) as Avg_Sal,max(salary) as Max_Sal,min(salary) as Min_Sal,count(salary) as Count_Sal
				from employee_demographics dem
                join employee_salary emp on
                           dem.employee_id=emp.employee_id
				Group By gender
)
Select avg(Avg_Sal) from
CTE_Example
;


Select avg(Avg_Sal) from
(				Select gender,avg(salary) as Avg_Sal,max(salary) as Max_Sal,min(salary) as Min_Sal,count(salary) as Count_Sal
				from employee_demographics dem
                join employee_salary emp on
                           dem.employee_id=emp.employee_id
				Group By gender
) as Gender_table;

# But CTE improves readability

With CTE_Example as
(
				Select gender,avg(salary) as Avg_Sal,max(salary) as Max_Sal,min(salary) as Min_Sal,count(salary) as Count_Sal
				from employee_demographics dem
                join employee_salary emp on
                           dem.employee_id=emp.employee_id
				Group By gender
)
Select avg(Avg_Sal) from
CTE_Example
;

# Does not work because CTEs are called right after their creation
Select * from
CTE_Example;

# Multiple CTEs within one
With CTE_Example as
(
Select employee_id,gender,birth_date
from employee_demographics 
where birth_date>'1985-01-01'
),
CTE_Example2 as
(Select employee_id,salary
from employee_salary
where salary>50000)
Select * from CTE_Example
join CTE_Example2
on
CTE_Example.employee_id=CTE_Example2.employee_id
;

With CTE_Example (Gender,AVG_Sal,MAX_Sal,MIN_Sal,COUNT_Sal) as
(
				Select gender,avg(salary),max(salary),min(salary),count(salary)
				from employee_demographics dem
                join employee_salary emp on
                           dem.employee_id=emp.employee_id
				Group By gender
)
Select * from
CTE_Example
;