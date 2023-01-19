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