-- ���� ������.
--������.
select employee_id, job_id
from employees
union -- ���������� ���ƾ��Ѵ�, ù��° set�� Į���� ���󰣴�. Ÿ���� ���ƾ��Ѵ�.
select employee_id, job_id
from job_history; -- set�� �⺻�� �ߺ��� ���� ����.

select employee_id, job_id
from employees
union all -- all �� �ϸ� �ߺ� �� ���� �������� �ʴ´�.
select employee_id, job_id
from job_history
order by employee_id;

-- ����: ���� ������ ���� ���� �ִ� ������� ���, �̸�, ������ ��ȸ�϶�.
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
