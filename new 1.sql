--查询工资高于500或岗位为MANAGER的雇员，同时还要满足他们的姓名首字母为大写的J
select * from emp where (sal>100 or job='manager') and ENAME LIKE 'j%';

--按照部门号升序而雇员的工资降序排序
SELECT ename,deptno ,sal from emp order by deptno asc , sal desc;

--使用年薪进行排序
select sal*12 as annual_salary from emp desc;

--显示工资最高的员工的名字和工作岗位
select ename,job,max(sal) from emp;

--显示工资高于平均工资的员工信息
select * from emp where sal > (select avg(sal) from emp);

--显示每个部门的平均工资和最高工资
select deptno,avg(sal),max(sal) from emp group by deptno;

--显示平均工资低于2000的部门号和和它的平均工资
select deptno,avg(sal) from emp group by deptno having avg(sal)<2000;

--显示每种岗位的雇员总数，平均工资
select count(*),avg(sal) from emp group by deptno;

--要emp表中的deptno = dept表中的deptno字段的记录
select emp.deptno,dept.deptno from emp,dept where emp.deptno=dept.deptno;

--显示部门号为10的部门名，员工名和工资
select dname,sal,ename from emp,dept where emp.deptno=dept.deptno and emp.deptno=10;

--显示各个员工的姓名，工资，及工资级别
select ename,sal,grade from emp,salgrade where emp.sal between salgrade.losal and salgrade.hisal;
select leader.empno,leader.ename from (emp as leader),(emp as worker) where leader.empno=worker.mgr and (worker.ename='FORD');

select ENAME,empno from emp where deptno=
(select deptno from emp where enam='SMITH');





--列出部门名称和这些部门的员工信息，同时列出没有员工的部门

select dept.dname,emp.*
from dept left join emp on
dept.deptno=emp.deptno;
select dept.dname,emp.* from dept left join emp on dept.deptno=emp.deptno;


--实战OJ6
--牛客：批量插入数据 
insert into actor (actor_id,first_name,last_name,last_update) 
values(1,'PENELOPE','GUINESS',datetime('2006-02-15 12:34:33')),(2,'NICK','WAHLBERG',datetime('2006-02-15 12:34:33'));

--牛客：找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照 逆序显示 
select distinct salary from salaries where to_date 
like '9999-01-01' order by salary desc;

--牛客：查找晚入职员工的所有信息 
select emp_no,birth_date,first_name,last_name,gender,hire_date 
from employees 
order by hire_date desc
 limit 1 offset 0;

--牛客：查找入职员工时间排名倒数第三的员工所有信息
select * from employees order by hire_date desc limit 1 offset 2;

--牛客：查找薪水涨幅超过15次的员工号emp_no以及其对应的涨幅次数t 
select emp_no,count(salary) as t from salaries group by emp_no 
having count(salary)>15;

--牛客：获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示 to_date='9999-01-01' 
select dept_no,dept_manager.emp_no,salary 
from dept_manager,salaries
where dept_manager.emp_no=salaries.emp_no 
and salaries.to_date like '9999-01-01'
and
dept_manager.to_date like '9999-01-01'
;

--牛客：从titles表获取按照title进行分组,每组个数大于等于2，给出title以及对应的数目t 
select title,count(title) as t 
from titles group by title having count(title)>=2
;


--leetcode: duplicate-emails leetcode: big-countries 
select  Email from Person
group by Email having count(Email)>1;

--leetcode: nth-highest-salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select Salary from Employee order by salary desc limit 1 offset n-1
  );
END


--leetcode: big-countries
select name,population,area from  World
where population>25000000 or area> 3000000;

--牛客：查找字符串'10,A,B' 中逗号','出现的次数cnt
select (length('10,A,B')-length(replace('10,A,B',',','')))/length(',') as cnt;


实战OJ8
--查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序
select employees.emp_no,salary
from employees,salaries 
where (employees.emp_no=salaries.emp_no and employees.hire_date=salaries.from_date)
order by employees.emp_no desc;








