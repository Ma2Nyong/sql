select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');
    
-- 과제: Kochar 에게 보고하는 사원들의 이름, 직업, 부서번호를 조회.