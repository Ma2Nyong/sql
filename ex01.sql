select *
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

desc departments

select last_name, salary, salary + 300
from employees;

-- 과제: 사원들의 월급, 연봉을 조회하라.
select salary, salary * 12 --과제
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees;

select last_name, job_id, 12 * salary + (12 * salary * commission_pct)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

-- 과제: 사원들의 사번, 이름, 직업, 입사일(STARTDATE)

select employee_id, last_name, job_id, hire_date as startdate
from employees;

-- 과제: 사원들의 사번(Emp #), 이름(Name), 직업(Job), 입사일(Hire Date)

select employee_id "Emp #", last_name "Name", job_id "Job", hire_date"Hire Date"
from employees;

select last_name || job_id
from employees;

select last_name || ' is ' || job_id
from employees;

select last_name || ' is ' || job_id employee
from employees;

select last_name || null
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || hire_date
from employees;

select last_name || (salary * 12)
from employees;

-- 과제: 사원들의 '이름, 직업'

select last_name || ', ' || job_id "Emp and Title"
from employees;