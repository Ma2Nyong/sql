-- DDL
drop table hire_dates;
-- null ���� �ִ� ����� insert�������� null ���� �ְų�, �����ϴ°�.
create table hire_dates (
emp_id number(8),
hire_date date default sysdate);

--date dictionary
select tname
from tab;

select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates(emp_id) values(3);

select * from hire_dates;

commit;

-- DCL (Date Control Language) ���ο� ��Ű���� �����.
