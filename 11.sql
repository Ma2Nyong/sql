-- 창문으로 바라보는 느낌, 창문안에 산이 있다? = x, 산은 산대로 공간을 가지고 있다.
create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);
-- create or replace, 만들거나 수정하거나, view를 수정.    
create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
    
desc empvu80;

-- 과제: 50번 부서원들의 사번, 이름, 부서번호로 구성된 DEPT50 view를 만들어라.
--      view 구조는 EMPNO, EMPLOYEE, DEPTNO 이다.
create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50;
    
desc dept50;
select * from dept50;

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;

create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;

select * from team50;

select count(*) from teams;

-- view 의 정체성과는 어긋나지만 view 에서도 추가 가 가능하다.
insert into team50
values(300, 'Marketing');

select count(*) from teams;

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;
-- with check option 은 where 절에서 지정한것이다.
    
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support'); -- error with check optiion 이 걸려서 안된다.

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
--insert 를 거부한다

insert into empvu10 values(501, 'abel', 'Sales'); --error read only 에 어긋난다.
select * from empvu10;

drop sequence team_teamid_seq;

create sequence team_teamid_seq;
-- sequence로 새로운 값을 뽑아내는법. currval - 현재값을 뽑아낸다.
select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;
-- cache = 미리 준비시켜놓는 작업, no chche 그걸 안한다. 준비된값을 다 사용했을때는 cycle 여부.
create sequence x_xid_seq
    start with 10 -- 시작지점.
    increment by 5 -- 한번에 올라가는
    maxvalue 20
    nocache
    nocycle;
    
select x_xid_seq.nextval from dual;

-- 과제: DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value 로 쓸 sequence를 만들어라.
--      sequence 는 400 이상, 1000 이하로 생성한다, 10씩 증가한다.
create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;

drop sequence dept_deptid_seq;

-- 과제: 위 sequence를 이용해서, DEPT 테이블에서 Education 부서를 insert 하라.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

-- index, query 알고리즘 에서 사용한다, pk를 지정하면 index 가 생성된다.
drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);
-- index에는 last_name 과 row id 가 있다.

select last_name, rowid
from employees;

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';

select index_name, index_type, table_owner, table_name
from user_indexes;

-- 과제: DEPT 테이블의 DEPARTMENT_NAME 에 대해 index를 만들어라.
create index dept_deptname_idx
on dept(department_name);

-- synonym, 별명을 붙힌다.
drop synonym team;

create synonym team
for departments;

select * from team;

-- 과제: employees 테이블에 emps synonym 을 만들어라
create synonym emps
for employees;

commit;