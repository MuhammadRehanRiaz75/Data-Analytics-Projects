# Using Temporary Tables
# Temporary tables are tables that are only visible to the session that created them. 
# They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.
# There's 2 ways to create temp tables:
# 1. This is the less commonly used way - which is to build it exactly like a real table and insert data into it
Create temporary table temp_table(
     first_name varchar(50),
     last_name varchar(50),
     favourite_movie varchar(100)
);

Insert into temp_table(first_name,last_name,favourite_movie)
VALUES 
('Alex','Freberg','Lord of the Rings: The Twin Towers');

Select * from temp_table;

# The second way is much faster and my preferred method
# 2. Build it by inserting data into it - easier and faster

create temporary table salary_over_50k
Select * from employee_salary
where salary>=50000;

Select * from salary_over_50k;


create temporary table salary_over_90k
Select * from employee_salary
where salary>=90000;

Select * from salary_over_90k;