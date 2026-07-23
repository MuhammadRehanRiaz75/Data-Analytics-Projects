# Case Statements add logic to your statements just like if else statement
Select first_name,last_name,age,
case
    when age<=30 then 'Young'
    when age between 31 and 50 then 'Old'
    when age>=51 then "On Death's Door"
end as Label
from employee_demographics;

Select first_name,last_name,salary,
case
    when salary<50000 then salary+(salary*0.05)
    when salary>=50000 then salary*1.07
end as New_Salary,
case
   when dept_id=6 then salary*0.10
end as Bonus
from employee_salary;


Select * from employee_salary as emp
join parks_departments as pd
on
  emp.dept_id=pd.department_id
where pd.department_name='Finance';