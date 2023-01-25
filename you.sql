select tname
from tab;
-- pk 속성 부여 constraint 테이블명_칼럼명_타입. db의 무결성을 확보하려고 사용한다.
-- primary key 는 감시하고있는 벨류가 테이블 내에서 유일해야 한다.
create table depts(
department_id number(3) constraint depts_detpid_pk primary key,
department_name varchar2(20));

desc user_constraints;


select constraint_name, constraint_type, table_name
from user_constraints;
-- primary key 에도 not null 이 포함되어 있지만, not null만 따로 사용할 수 있다. *필수값
create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empname_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3), -- references와 다른값을 넣으려고 하면 error가 뜬다.
constraint emps_email_uk unique(email), -- 제약조건을 옆에 붙히지않고 따로 작성할때,
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id)); -- relation ship 을 지정해준다. 무결성을 확보하기 위해서,

select constraint_name, constraint_type, table_name
from user_constraints;
-- constraint_type P - Primarykey, C - not null, C - Check, U - unique, R - relation ship
-- primarykey 는 기술적인 관점에서는 unique + not null 의 특징을 가지고 있다.
insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

-- 제약조건을 같이 없애야 한다, cascade
drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

-- hr 스키마로 변경후 확인하면 없다고 뜬다.
select * from depts;
