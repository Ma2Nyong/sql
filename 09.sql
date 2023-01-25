drop table emp; --삭제하고 싶은 테이블네임을 적으면 삭제된다.

create table dept( -- 테이블 이름
department_id number(4), -- 칼럼명(멤버변수) 과 타입, 단위(4자리)를 적는다.
department_name varchar2(30), -- varchar2의 단위는(Byte)
manager_id number(6),
location_id number(4)
);
-- ddl data definition language 이다.
create table emp (
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8, 2),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4));

insert into dept(department_id, department_name, manager_id, location_id)
values (100, 'Public Relation', 100, 1700);

insert into dept(department_id, department_name)
values (310, 'Purchasing');

select *
from dept;

commit;

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis' , 'Pop',
    'Pop@gmail.com', '010-378-1278', sysdate,
    'AC_ACCOUNT', 6900, null,
    205, 110);
    
insert into emp
values(320, 'Terry', 'Benard',
        'Bernard@gmail.com', '010-637-0972', '2022/07/20',
        'AD_PRES', 5000, .2,
        100, 300);
        
commit;

select * from emp;

create table sa_reps (
rep_id number(6),
rep_name varchar2(25),
salary number(8, 2),
commission_pct number(2, 2)
);

insert all -- 복수의 values 를 insert 할때 table의 이름을 다르게 할 수 있다.
    into sa_reps values(1, '최한석', 20000, .1)
    into sa_reps values(2, '한아름', 30000, .12)
select * from dual; -- 문법을 맞추기 위해 더미테이블을 조회한다.

commit;

select * from sa_reps;

declare -- 변수선언 begin 과 end 사이에서 쓸 수있다.
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(rep_id, rep_name, salary, commission_pct)
        values (base + i, 'n' || (base + i), base * i, i * 0.01);
    end loop;
end;
/
-- end 했다고 끝이 아니라 /가 있어야 compile 을 한다. 
select *
from sa_reps
where rep_id > 400;

commit;
-- 원래 있던 데이터를 옮긴다. 나만의 테이블에 이름을 붙힌다?
insert into sa_reps(rep_id, rep_name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

commit;
--update --일부 필드만 update하는법.
update emp
set job_id = 'IT_PROG',
    salary = 30000
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

update emp
set salary = null
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;
--commit 을 하기 전인 상태에서 롤백을 할 수 있다. 마지막 commit 시점으로 간다.
rollback;

select job_id, salary
from emp
where employee_id = 300;

-- sub query를 활용한 update 방법.
update emp
set job_id = (select job_id
                from employees
                where employee_id = 205),
    salary = (select salary
                from employees
                where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;

select job_id, salary
from emp
where employee_id = 300;
-- 좋은코드로 변환.
update emp
set (job_id, salary) = (
    select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

commit;
-- delete / hr 과제 시간때는 만만한 delete 부터 만들고 update를 만들어라.
delete dept
where department_id = 310;

select * from dept;

rollback;

select * from dept;


delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Purchasing');

select * from emp;

commit;
-- 가장 중요한것은 commit 이다.