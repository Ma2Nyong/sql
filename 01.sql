select * -- 전체
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

desc departments -- 어떤칼럼으로 구성되어있나 확인.

select last_name, salary, salary + 300
from employees;

-- 과제: 사원들의 월급, 연봉을 조회하라.

select salary, salary * 12
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees;

select last_name, job_id, 12 * salary + (12 * salary * commission_pct)
from employees; -- null값이 있어 버그이다. 해결책은 4장에서.

select last_name as name, commission_pct comm
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

-- 과제: 사원들의 사번, 이름, 직업, 입사일(STARTDATE)을 조회하라.

select employee_id, last_name, job_id, hire_date as startdate --얼라이어스,
from employees;

-- 과제: 사원들의 사번(Emp #), 이름(Name), 직업(Job), 입사일(Hire Date)을 조회하라

select employee_id "Emp #", last_name "Name", job_id "Job", hire_date "Hire Date"
from employees;

select last_name || job_id -- 붙히기 연산자의 특징은 char 이다. 작은 ' '
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