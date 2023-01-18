select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000'; -- char -> num 로 변환된다.

select hire_date || ''
from employees;

select salary || ''
from employees;
-- 문자와 날짜가 charactor 형식으로 변환하는 방식1.
select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual; -- 날짜의 형식을 지정할 수 있다.
-- 문자와 날짜가 charactor 형식으로 변환하는 방식2.

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual; -- 연월일 요일

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;

select to_char(sysdate, 'd')
from dual; -- 요일을 나타내고 문자값으로 나다난다. --과제에 나온다--

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

-- 과제: 위 테이블을 월요일부터 입사일순 오름차순 정렬하라.

select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY') --fill mode
from employees; -- 공간을 압축시켜서 빈공간을 채운다? 

-- 과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한지 3개월 후 첫번째 월요일이다.
--      날짜는 YYYY.MM.DD 로 표시한다.



select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999') -- 도구 환경설정 nls 지역을 바꿔주면 $, 원 으로 바뀐다.
from dual;

-- 과제: <이름> earns <$,월급> monthly but wants <$,월급 x 3>. 로 조회하라.
select last_name || ' earns ' ||
    to_char(salary, 'fm$99,999') || ' monthly but wants ' ||
    to_char(salary * 3, 'fm$99,999') || '.'
from employees;

select last_name, hire_date
from employees 
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy'); -- 패턴을 지정해주어야 한다.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy'); -- 오류값이나 읽을수있음.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy'); -- 정확한 패턴에 맞추려면 fx를 붙힌다,

select to_number('1237')
from dual; -- char를 number로 변환하는 방법.

select to_number('1,237.12') -- , 문자가 포함되어서 읽지 못한다.
from dual;

select to_number('1,237.12', '9,999.99') -- 패턴을 만들어준다. 허나 안쓰인다.
from dual;

select nvl(null, 0)
from dual;

select job_id, nvl(commission_pct, 0)
from employees;

-- 과제: 사원들의 이름, 직업, 연봉을 조회하라.

select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12 ann_sal
from employees
order by ann_sal desc;

-- 과제: 사원들의 이름, 커미션율을 조회하라.
--      커미션이 없으면, No Commission을 표시한다.
select last_name, nvl(to_char(commission_pct), 'no commission')
from employees;

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees; -- true 면 첫번째 값을 return, false면 두번째값을 return.

select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees; -- 칼럼안에 값은 동일함으로 0 은 문자이다.

select first_name, last_name,
    nullif(length(first_name), length(last_name))
from employees; -- 두개의 parameter의 값이 같으면 null을 출력하고 다르면 첫번째 값을 출력한다.

select to_char(null), to_number(null), to_date(null)
from dual; -- null 은 타입이 없다. 허나 타입을 입혀주고 싶을때 사용한다.

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees; -- 첫번째 값이 false면 두번째 값을 return, 두번째마저 false면 맨뒤에 none 출력.

select last_name, salary,
    decode(trunc(salary / 2000),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
            0.45) tax_rate
from employees
where department_id = 80;

select decode(salary, 'a', 1)
from employees; -- 기본값을 명시하지 않았을 경우 null 이 기본값이다.

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees; -- job_id 의 값이 char 이기에 에러가 뜬다.

-- 과제: 사원들의 직업, 직업별 등급을 조회하라.
--      기본 등급은 null 이다.
--      IT_PROG     A
--      AD_PRES     B
--      ST_MAN      C
--      ST_CLERK    D
select job_id, decode(job_Id,
    'IT_PROG', 'A',
    'AD_PRES', 'B',
    'ST_MAN', 'C',
    'ST_CLERK','D') grade
from employees;
--decode의 알고리즘과 동일한 뜻을 가지고 있는 문법.
select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AD_PRES' then 1.05 * salary
    else salary end revised_salary
from employees; -- case 부터 end 까지가 하나이다.

select case job_id when '1' then 1
                    when '2' then 2
                    else 0
        end grade
from employees;

select case job_id when '1' then '1'
                    when '2' then '2'
                    else '0'
        end grade
from employees;

select case salary when 1 then '1'
                    when 2 then '2'
                    else '0'
        end grade
from employees;
-- 기준값은 기준값끼리 타입이 같으면 되고 리턴값은 리턴값끼리만 같으면 된다.

select last_name, salary,
    case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'high'
        else 'good'
    end grade
from employees; -- 베타적인 특성을 가지고 있다.

--과제: 사원들의 이름, 입사일, 입사요일을 월요일부터 요일순으로 조회하라.
select last_name, hire_date, to_char(hire_date, 'fmday') day
from employees
order by case day 
        when 'monday' then 1
        when 'thesday' then 2
        when 'wednesday' then 3
        when 'thursday' then 4
        when 'friday' then 5
        when 'saturday' then 6
        when 'sunday' then 7
    end ;
    
--과제: 2005년 이전 입사한 사원들에게 100만원 상품권,
--      2005년 후에 입사한 사원들에게 10만원 상품권을 지급한다.
--      사원들의 이름, 입사일, 상품권 금액을 조회하라.
select last_name, hire_date, 
    case when hire_date <= '2005/12/31' then '1,000,000'
        when hire_date >= '2006/01/01' then '500,000'
        end bonus
from employees;