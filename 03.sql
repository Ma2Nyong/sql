-- single function
desc dual
select * from dual; -- 더미 생성

select lower('SQL Course') -- parameter로 row하나만 들어갔다.
from dual; 

select upper('SQL Course') -- 대문자로 출력
from dual;

select initcap('SQL Course') -- 소문자로 출력.
from dual;

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins'; -- lastname 을 포함한 row가 들어갔다.
--row function의 return 값 과 higgins 를 비교하는것이다.
select concat('Hello', 'World')
from dual;

select substr('HelloWorld', 2, 5) -- ( '편집물', index, length )
from dual; -- 2에서부터 5글자를 보여준다. ' elloW '

select substr('Hello', -1, 1) -- 오른쪽에서 부터 보여준다.
from dual; 

select length('Hello') -- 몇글자인지 알려준다.
from dual;

select instr('Hello', 'l') -- index 3에 위치해 있다 왼쪽부터 검사하기에 3이다.
from dual; 
select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*') -- 5칸으로 칸수를 고정하고 나머지를 *로 채운다
from employees;

select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL') -- j를 bl로 바꾼다.
from dual;

select trim('H' from 'Hello') -- h를 뜯어낸다.
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--과제: 위 query에서 ' '가 trim 됐음을, 눈으로 확인할 수 있게 조회하라.

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

--과제: 위 query에서, where 절 을 like 로 refactoring 하라.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

