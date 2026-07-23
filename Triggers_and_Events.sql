# Triggers
# A Trigger is a block of code that executes automatically when an event takes place in a table.
# For example we have these 2 tables, invoice and payments - when a client makes a payment we want it to update the invoice field "total paid"
# to reflect that the client has indeed paid their invoice
Delimiter $$
Create trigger employee_insert
       After insert on employee_salary
       for each row
Begin
    Insert into employee_demographics(employee_id,first_name,last_name)
    values (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
Delimiter ;

Insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
values(13,'Rehan','Riaz','Data Analyst','1000000',null);

Select * from employee_salary;
       
Select * from employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_delete
AFTER DELETE ON employee_salary
FOR EACH ROW
BEGIN
    DELETE FROM employee_demographics
    WHERE employee_id = OLD.employee_id;
END $$
DELIMITER ;
SET SQL_SAFE_UPDATES = 0; 
Delete from employee_salary where employee_id=13;
SET SQL_SAFE_UPDATES = 1;
# Now let's look at Events
# Now I usually call these "Jobs" because I called them that for years in MSSQL, but in MySQL they're called Events
# Events are task or block of code that gets executed according to a schedule. These are fantastic for so many reasons. Importing data on a schedule. 
# Scheduling reports to be exported to files and so many other things
# you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want
# This really helps with automation in MySQL
# let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
# All we have to do is delete them from the demographics table

Show Events;
Delimiter $$
Create Event delete_retirees on
schedule every 30 second
Do
Begin
   Delete from employee_demographics
   where age>=60;
End $$
Delimiter ;

Select * from employee_demographics;
Show variables like 'event%';




