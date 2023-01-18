select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000';

select hire_date || ''
from employees;

select salary || ''
from employees;

select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;

select to_char(sysdate, 'd')
from dual;

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

-- 과제: 위 테이블을 월요일부터 입사일순 오름차순 정렬하라.

select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date -1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY')
from employees;

--과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한지 3개월 후 첫번째 월요일이다.