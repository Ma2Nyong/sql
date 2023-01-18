-- single function
desc dual
select * from dual; -- ���� ����

select lower('SQL Course') -- parameter�� row�ϳ��� ����.
from dual; 

select upper('SQL Course') -- �빮�ڷ� ���
from dual;

select initcap('SQL Course') -- �ҹ��ڷ� ���.
from dual;

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins'; -- lastname �� ������ row�� ����.
--row function�� return �� �� higgins �� ���ϴ°��̴�.
select concat('Hello', 'World')
from dual;

select substr('HelloWorld', 2, 5) -- ( '������', index, length )
from dual; -- 2�������� 5���ڸ� �����ش�. ' elloW ' length�� ���������ϴ�.

select substr('Hello', -1, 1) -- �����ʿ��� ���� �����ش�.
from dual; 

select length('Hello') -- ��������� �˷��ش�.
from dual;

select instr('Hello', 'l') -- index 3�� ��ġ�� �ִ� ���ʺ��� �˻��ϱ⿡ 3�̴�.
from dual; 
select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*') -- 5ĭ���� ĭ���� �����ϰ� �������� *�� ä���
from employees;

select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL') -- j�� bl�� �ٲ۴�.
from dual;

select trim('H' from 'Hello') -- h�� ����.
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--����: �� query���� ' '�� trim ������, ������ Ȯ���� �� �ְ� ��ȸ�϶�.

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

--����: �� query����, where �� �� like �� refactoring �϶�.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

--����: �̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�.
--      �̸��� ù���ڴ� �빮��, �������� �ҹ��ڷ� ����Ѵ�.

select initcap (last_name), length(last_name)
from employees
where last_name like 'J%' or
     last_name like 'A%' or
     last_name like 'M%';

select round(45.926, 2) -- �ݿø�, �Ҽ����ڸ����� �����Ѵ�.
from dual;
select trunc(45.926, 2) -- �ݳ���, �Ҽ����ڸ����� �����Ѵ�.
from dual;

select round (45.923, 0), round(45.923)
from dual;
select trunc (45.923, 0), trunc(45.923)
from dual;

--����: ������� �̸�, ����, 15.5% �λ�� ����(New Salary, ����), �λ��(Increase)�� ��ȸ�϶�.

select last_name, salary,
    round (salary * 1.155) "New Salary", 
    round(salary * 0.155) "Increase"
    --round(salary * 1.155) - salary "Increase" ���俹��.
from employees;

select sysdate
from dual;

select sysdate + 1
from dual;

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31') --�� ��¥ ������ �������� ���Ѵ�.
from dual;

select add_months('2024/01/18', 3) --���� ���� ���Ѵ�.
from dual;

select next_day('2023/01/18', 4) -- �ڿ��ִ� ���� 4�� �ٰ����� �������� ���Ѵ�.
from dual;

select next_day('2023/01/18', 'thursday') -- �ٰ����� ������� ���Ѵ�.
from dual;

select next_day('2023/01/18', 'thu') 
from dual;

select last_day('2023/01/18') -- ������ ���Ѵ�.
from dual;

--����: 20�� �̻� ������ ������� �̸�, ù�������� ��ȸ�϶�.
--      ������ �ſ� ���Ͽ� �����Ѵ�.
select last_name, last_day(hire_date) 
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

-- ����: ������� �̸�, ���� �׷����� ��ȸ�϶�.
--      �׷����� $1000 �� * �ϳ��� ǥ���Ѵ�.
select last_name, salary,
       lpad('*', trunc(salary / 1000), '*') sal
       -- rpad(' ', salary / 1000 + 1, '*') ���俹��.
from employees
order by sal desc;
