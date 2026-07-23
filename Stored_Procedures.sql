Select * from employee_salary
where salary>=50000;

Create Procedure large_salaries()
Select * from employee_salary
where salary>=50000;

call large_salaries();

Delimiter $$
Create Procedure large_salaries2()
Begin
      Select * from employee_salary
      where salary>=50000;
      Select * from employee_salary
      where salary>=10000;
End $$
Delimiter ;

call large_salaries2();

Delimiter $$
Create Procedure large_salaries3(employee_id_parm int)
Begin
      Select * from employee_salary
      where employee_id=employee_id_parm;
End $$
Delimiter ;

call large_salaries3(2);



