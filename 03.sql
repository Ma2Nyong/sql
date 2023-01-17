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
from dual; -- 2�������� 5���ڸ� �����ش�. ' elloW '

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

