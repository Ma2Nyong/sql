-- join
select department_id, department_name, location_id
from departments;

select location_id, city
from locations;

-- equi join
select department_id, department_name, location_id, city
from departments natural join locations;
-- 양쪽테이블의 공통 칼럼을 찾는다. equals, 공통 id를 바탕으로 join 시킨다
-- join 되지 않은것들은 버린다. 현장에서 안쓰인다.

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50); -- join 후보를 골라내고 싶으면 where를 쓰면된다.

select employee_id, last_name, department_id, location_id
from employees join departments
using (department_id); --공통 칼럼을 using 에 명시한다.

-- 과제: 위에서 누락된 1인의 이름, 부서번호를 조회하라.
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from employees natural join departments;

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400; -- 너무 길다. from 에서 별명을 줄 수 있다.

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400; --where 절에 접두사를 붙힐 수 있을까?

select l.city, d.department_name
from locations l join departments d
using (location_id)
where d.location_id = 1400;

select l.city, d.department_name, d.location_id
from locations l join departments d
using (location_id) -- using 에 쓴 칼럼에는 접두사를 붙힐 수 없다.
where location_id = 1400;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.manager_id = 100; --using 에 쓰이지 않았으면 접두사를 붙혀야 한다.

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id);

select employee_id, city, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--과제 위 query를 using 으로 refactoring 하라.
select employee_id, city, department_name
from employees e join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

-- 과제: Toronto 에 위치한 부서에서 일하는 사원들의
--      이름, 직업, 부서번호, 부서명, 도시를 조회하라.
select e.last_name, e.job_id, e.department_id,
    d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
and l.city = 'Toronto'; -- on이 조건문이기에 where 또는 and 를 써도 값이 같다.

--non-equi join 을 할 수 있다.
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

-- self join -- 하나의 테이블에 있는 row들 끼리 join한다.
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id; -- 헷갈려서 error

select last_name emp, last_name mgr -- 논리적 테이블이기에 접두사를 생략하면 애매하기에 error
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

-- 과제: 같은 부서에서 일하는 사원들의 부서번호, 이름, 동료명을 조회하라.
select e.department_id, e.last_name employee, c.last_name colleague
from employees e join employees c
on e.department_id = c.department_id
and e.employee_id <> c.employee_id
order by 1, 2, 3;

--과제: Davies 보다 후에 입사한 사원들의 이름, 입사일을 조회하라.
select e.last_name, e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date;

-- 과제: 매니저보다 먼저 입사한 사원들의 이름, 입사일, 매니저명, 매니저 입사일을 조회하라.
select w.last_name, w.hire_date, m.last_name mgr_Name, m.hire_date mgr_hire
from employees w join employees m
on  w.manager_id = m.manager_id
and w.hire_date < m.hire_date;

-- inner join -- join된 row들만 테이블에 보여준다. 위에 것들도 다 inner join이다.
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

--outer join
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id; -- join 되지않은 Grant 가 포함되어 있다.

select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id; -- join 되지 않은 부서들이 포함되어 있다.

select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id; -- 포함되지않은 부서가없는 사람, 사람이 없는 부서

--과제: 사원들의 이름, 사번, 매니저명, 매니저 사번을 조회하라.
--      King 회장도 테이블에 포함하라.
select w.last_name, w.employee_id, m.last_name, m.employee_id
from employees w left outer join employees m
on w.manager_id = m.employee_id
order by 2;

--20세기의 join 표현법.
select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id -- inner join, equi join
    and d.department_id in (20, 50);

-- 3개 테이블 join
select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

--non_equi join
select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

--outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id; --right outer join

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); --left outer join

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id(+); -- 과거에 full outer join 은 없다.

--self join
select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;