Select length('Rehan');

Select first_name,length(first_name) as Name_Length from employee_demographics
order by Name_Length;

Select first_name,upper(first_name) from employee_demographics;

Select first_name,lower(first_name) from employee_demographics;

Select trim('     sky      ');

Select LTRIM('     sky      ');

Select rtrim('     sky      ');

Select first_name,
left(first_name,4),
right(first_name,4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as Birth_Month
from employee_demographics;

Select first_name,replace(first_name,'A','Z') from employee_demographics;

Select locate('h','Rehan');

Select first_name,locate('An',first_name) from employee_demographics;

Select first_name,last_name,concat(first_name,' ',last_name) as Full_Name from employee_demographics;

