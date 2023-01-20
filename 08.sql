-- 집합 연산자.
--합집합.
select employee_id, job_id
from employees
union -- 전제조건이 같아야한다, 첫번째 set의 칼럼을 따라간다. 타입이 같아야한다.
select employee_id, job_id
from job_history; -- set의 기본은 중복된 값이 없다.

select employee_id, job_id
from employees
union all -- all 을 하면 중복 된 값을 제거하지 않는다.
select employee_id, job_id
from job_history
order by employee_id;

-- 과제: 과거 직업을 현재 갖고 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history j
                where e.job_id = j.job_id
                and e.employee_id = j.employee_id);

select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history j
                    where e.employee_id = j.employee_id);

select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;
