-- join
select department_id, department_name, location_id
from departments;

select location_id, city
from locations;

-- equi join
select department_id, department_name, location_id, city
from departments natural join locations;
-- �������̺��� ���� Į���� ã�´�. equals, ���� id�� �������� join ��Ų��
-- join ���� �����͵��� ������. ���忡�� �Ⱦ��δ�.

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50); -- join �ĺ��� ��󳻰� ������ where�� ����ȴ�.

select employee_id, last_name, department_id, location_id
from employees join departments
using (department_id); --���� Į���� using �� ����Ѵ�.

-- ����: ������ ������ 1���� �̸�, �μ���ȣ�� ��ȸ�϶�.
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from employees natural join departments;

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400; -- �ʹ� ���. from ���� ������ �� �� �ִ�.

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400; --where ���� ���λ縦 ���� �� ������?

select l.city, d.department_name
from locations l join departments d
using (location_id)
where d.location_id = 1400;

select l.city, d.department_name, d.location_id
from locations l join departments d
using (location_id) -- using �� �� Į������ ���λ縦 ���� �� ����.
where location_id = 1400;