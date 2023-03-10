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

select location_id, department_name -- 첫번째 테이블이 num / char 이므로 받는데 지장이 없다.
from departments
union
select location_id, state_province
from locations;

-- 과제: 위 문장을 service 관점에서 고쳐라.
--      union 을 사용한다.

select location_id, department_name, null state
from departments
union -- 정보가 겹치기에 상황이 발생한것이기에 null값을 주어 분리한다
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id
from job_history; -- 칼럼 개수가 안맞아서 error

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0 -- num 배열에 맞게 0을 입력
from job_history
order by salary;
