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

-- grant 명령어는 일반유저로는 실행이 불가능하다. 시스템 스키마로 변경후 가능하다.
-- read 와 right 의 권한을 준다.
grant all on hr.departments to you;

drop table employees cascade constraints;
create table employees(
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                    constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6) constraint emp_managerid_fk references employees(employee_id),
department_id number(4) constraint emp_dept_fk references hr.departments(department_id));

-- 부모 table 에서 fk를 삭제하면?
create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);

-- references on delete cascade 를 해주면, 같이 삭제한다.
create table dong(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade);
-- references on delete set null 를 해주면, null값이 들어간다.
create table dong2(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼성동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

insert into dong2
select * from dong;

delete gu
where gu_id = 100;

select * from dong;
select * from dong2;

commit;

--constraint 를 재우는 법
create table a (
aid number(1) constraint a_aid_pk primary key);

create table b (
bid number(2),
aid number(1),
constraint b_aid_fik foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(32, 9);
-- alrter 를 사용하여 foreign key 재우는 법,
alter table b disable constraint b_aid_fik;

-- alrter 를 사용하여 foreign key 깨우는 법, 그러나 error fk가 없기에,
alter table b enable constraint b_aid_fik;
-- 깨우기는 하되, 검사를 안하게 하는법,
alter table b enable novalidate constraint b_aid_fik;

insert into b values(33, 8); -- error

-- frint table
create table sub_departments as
    select department_id dept_id, department_name dept_name
    from hr.departments;
    
select * from sub_departments;

create table users(
user_id number(3));
desc users

alter table users add(user_name varchar2(10));
desc users

alter table users modify(user_name number(7));
desc users

alter table users drop column user_name;
desc users

insert into users values(1);

alter table users read only;
insert into users values(2); -- read only 이기에 error

alter table users read write;
insert into users values(2);

commit;
