-- Parte 1 – Personalizando acessos com views 

use company_constraints;



-- View para número de empregados por departamento e localidade --

create view number_of_employees_per_dept_and_location_view as
	select d.Dname, dl.Dlocation as "Localização", count(*) as "Número de empregados"
    from employee e, departament d, dept_locations dl
    where e.Dno = d.Dnumber and d.Dnumber = dl.Dnumber
    group by d.Dname, dl.Dlocation;
    
select * from number_of_employees_per_dept_and_location_view;


-- View para lista de departamnetos e seus gerentes
create view departments_managers_view as
	select d.Dname as Departamento, d.Dnumber as "Número do departamento", concat(Fname, ' ', Minit, ' ', Lname) as Gerente, e.Ssn as "Código gerente"
	from employee e, departament d
	where e.Super_ssn is null and e.Dno = d.Dnumber;

select * from departments_managers_view;


-- view para projetos com maior número de empregados
create view projects_with_max_employees_view as
	select p.Pname, count(*) as "Número de empregados"
	from project p, works_on w
	where w.Pno = p.Pnumber
	group by p.Pname
	having count(*) = (
		select count(*)
		from project p2, works_on w2
		where w2.Pno = p2.Pnumber
		group by p2.Pname
		order by count(*) desc
		limit 1);
        
select * from projects_with_max_employees_view;
        
-- view para lista de projetos, departamentos e gerentes
create view departments_managers_view as
	select d.Dname as Departamento, d.Dnumber as 'Número do departamento', concat(Fname, ' ', Minit, ' ', Lname) as Gerente, e.Ssn as "Código gerente"
	from employee e, departament d
	where e.Super_ssn is null and e.Dno = d.Dnumber;

select * from departments_managers_view;    
    
-- view para lista de projetos, departamentos e gerentes
create view project_department_manager_view as
	select p.Pname, dm.Departamento, dm.Gerente
	from project p, departments_managers_view dm
	where p.Dnum = dm.`Número do departamento`;
    
select * from project_department_manager_view;

select * from project_department_manager_view;


-- view para listar empregados que possuem dependentes e se são gerentes
create view employees_with_dependents_isManager_view as
	select e.Ssn, concat(Fname, ' ', Minit, ' ', Lname) as Nome, (exists(select 1 from employee e2 where Super_ssn is null and e.Ssn = e2.Ssn)) as isManager
	from employee e
	where exists(select 1 from dependent d where e.Ssn = d.Essn);
    
select * from employees_with_dependents_isManager_view;


-- ------------------------------------------------------------------------------

-- Criando usuários e definindo permissão de acesso

use mysql;
show tables;
select * from user;

create user 'gerente'@localhost identified by 'gerente123';
grant select on company_constraints.employee to 'gerente'@localhost;
grant insert on company_constraints.employee to 'gerente'@localhost;
grant update on company_constraints.employee to 'gerente'@localhost;
grant select on company_constraints.departament to 'gerente'@localhost;
grant select on company_constraints.number_of_employees_per_dept_and_location_view to 'gerente'@localhost;
grant select on company_constraints.departament to 'gerente'@localhost;
grant select on company_constraints.projects_with_max_employees_view to 'gerente'@localhost;

flush privileges;

create user 'employee'@localhost identified by 'employee123';
grant select on company_constraints.projects_with_max_employees_view to 'employee'@localhost;

flush privileges;