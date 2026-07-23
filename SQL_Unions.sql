# Union allows you to combine rows together
Select first_name,last_name from employee_demographics
Union
Select first_name,last_name from employee_salary;

# To select duplicates because union only selects distinct values
Select first_name,last_name from employee_demographics
Union All
Select first_name,last_name from employee_salary;

Select first_name,last_name,'Old Man' as Label from employee_demographics
where age>40 and gender='Male'
Union
Select first_name,last_name,'Old Lady' as Label from employee_demographics
where age>40 and gender='Female'
Union
Select first_name,last_name,'Highly Paid Employee' as Label from employee_salary
where salary>70000
order by first_name;