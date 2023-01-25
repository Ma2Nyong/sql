select tname
from tab;
-- pk �Ӽ� �ο� constraint ���̺��_Į����_Ÿ��. db�� ���Ἲ�� Ȯ���Ϸ��� ����Ѵ�.
-- primary key �� �����ϰ��ִ� ������ ���̺� ������ �����ؾ� �Ѵ�.
create table depts(
department_id number(3) constraint depts_detpid_pk primary key,
department_name varchar2(20));

desc user_constraints;


select constraint_name, constraint_type, table_name
from user_constraints;
-- primary key ���� not null �� ���ԵǾ� ������, not null�� ���� ����� �� �ִ�. *�ʼ���
create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empname_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3), -- references�� �ٸ����� �������� �ϸ� error�� ���.
constraint emps_email_uk unique(email), -- ���������� ���� �������ʰ� ���� �ۼ��Ҷ�,
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id)); -- relation ship �� �������ش�. ���Ἲ�� Ȯ���ϱ� ���ؼ�,

select constraint_name, constraint_type, table_name
from user_constraints;
-- constraint_type P - Primarykey, C - not null, C - Check, U - unique, R - relation ship
-- primarykey �� ������� ���������� unique + not null �� Ư¡�� ������ �ִ�.
insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

-- ���������� ���� ���־� �Ѵ�, cascade
drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

-- hr ��Ű���� ������ Ȯ���ϸ� ���ٰ� ���.
select * from depts;
