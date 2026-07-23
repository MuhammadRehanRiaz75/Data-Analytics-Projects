Select * from parks_and_recreation.employee_salary;

Select * from parks_and_recreation.employee_salary
where first_name='Leslie';

Select * from parks_and_recreation.employee_salary
where salary>50000;

Select * from parks_and_recreation.employee_salary
where salary>=50000;

Select * from parks_and_recreation.employee_salary
where salary<50000;

Select * from parks_and_recreation.employee_salary
where salary<=50000;

Select * from parks_and_recreation.employee_demographics
where gender='Female';

Select * from parks_and_recreation.employee_demographics
where gender!='Female';

Select * from parks_and_recreation.employee_demographics
where birth_date>'1985-01-01';

Select * from parks_and_recreation.employee_demographics
where birth_date>'1985-01-01' and gender='male';

Select * from parks_and_recreation.employee_demographics
where birth_date>'1985-01-01' or gender='male';

Select * from parks_and_recreation.employee_demographics
where birth_date>'1985-01-01' or not gender='male';

Select * from parks_and_recreation.employee_demographics
where (first_name='Leslie' and age=44) or age>55;

Select * from parks_and_recreation.employee_demographics
where first_name like 'Jer%';

Select * from parks_and_recreation.employee_demographics
where first_name like '%er%';

Select * from parks_and_recreation.employee_demographics
where first_name like 'a%';

# Starts with a and after that only two characters
Select * from parks_and_recreation.employee_demographics
where first_name like 'a__';

# Starts with a and after that only three characters
Select * from parks_and_recreation.employee_demographics
where first_name like 'a___';

Select * from parks_and_recreation.employee_demographics
where first_name like 'a___%';

Select * from parks_and_recreation.employee_demographics
where birth_date like '1989%';