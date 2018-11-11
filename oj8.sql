--查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序
select employees.emp_no,salary from employees,salaries 
where employees.emp_no=salaries.emp_no and employees.hire_date=salaries.from_date
order by employees.emp_no desc;

--针对库中的所有表生成select count(*)对应的SQL语句
SELECT "select count(*) from " || name || ";" AS cnts 
FROM sqlite_master WHERE type = 'table';

--获取所有非manager的员工emp_no
select employees.emp_no from employees
where employees.emp_no not in(select emp_no from dept_manager); 

--获取所有员工当前的manager，如果当前的manager是自己的话结果不显示，当前表示to_date='9999-01-01'。
--结果第一列给出当前员工的emp_no,第二列给出其manager对应的manager_no。
select    distinct de.emp_no as emp_no, dm.emp_no as manager_no 
from    dept_emp as de , dept_manager as dm 
where de.emp_no !=dm.emp_no 
and de.dept_no = dm.dept_no 
and de.to_date='9999-01-01'
and dm.to_date='9999-01-01';

--针对actor表创建视图actor_name_view，只包含first_name以及last_name两列，
--并对这两列重新命名，first_name为first_name_v，last_name修改为last_name_v：
create view actor_name_view as select first_name as first_name_v,
last_name as last_name_v from actor;
