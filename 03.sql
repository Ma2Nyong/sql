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
from dual; -- 2에서부터 5글자를 보여준다. ' elloW ' length는 생략가능하다.

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

--과제: 이름이 J나 A나 M으로 시작하는 사원들의 이름, 이름의 글자수를 조회하라.
--      이름의 첫글자는 대문자, 나머지는 소문자로 출력한다.

select initcap (last_name), length(last_name)
from employees
where last_name like 'J%' or
     last_name like 'A%' or
     last_name like 'M%';

select round(45.926, 2) -- 반올림, 소수점자리수를 선택한다.
from dual;
select trunc(45.926, 2) -- 반내림, 소수점자리수를 선택한다.
from dual;

select round (45.923, 0), round(45.923)
from dual;
select trunc (45.923, 0), trunc(45.923)
from dual;

--과제: 사원들의 이름, 월급, 15.5% 인상된 월급(New Salary, 정수), 인상액(Increase)을 조회하라.

select last_name, salary,
    round (salary * 1.155) "New Salary", 
    round(salary * 0.155) "Increase"
    --round(salary * 1.155) - salary "Increase" 정답예문.
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

select months_between('2023/12/31', '2022/12/31') --두 날짜 사이의 개월수를 구한다.
from dual;

select add_months('2024/01/18', 3) --개월 수를 더한다.
from dual;

select next_day('2023/01/18', 4) -- 뒤에있는 숫자 4는 다가오는 수요일을 말한다.
from dual;

select next_day('2023/01/18', 'thursday') -- 다가오는 목요일을 구한다.
from dual;

select next_day('2023/01/18', 'thu') 
from dual;

select last_day('2023/01/18') -- 말일을 구한다.
from dual;

--과제: 20년 이상 제직한 사원들의 이름, 첫월급일을 조회하라.
--      월급은 매월 말일에 지급한다.
select last_name, last_day(hire_date) 
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

-- 과제: 사원들의 이름, 월급 그래프를 조회하라.
--      그래프는 $1000 당 * 하나를 표시한다.
select last_name, salary,
       lpad('*', trunc(salary / 1000), '*') sal
       -- rpad(' ', salary / 1000 + 1, '*') 정답예문.
from employees
order by sal desc;
