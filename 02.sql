-- where
select employee_id, last_name, department_id
from employees
where department_id = 50; -- boolean 타입으로 작성해주면된다.

--과제: 176번 사원의 사번, 이름, 부서번호를 조회하라.

select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id --statement에서는 대소문자를 구분하지않는다.
from employees
where last_name = 'Whalen'; --data 에서는 대소문자구분을한다, 유니코드값이므로.

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06'; -- 클라이언트가 지정한 날짜형식에 맞춰서

select last_name, salary
from employees
where salary <= 3000;

-- 과제: 월 $12,000 이상 버는 사원들의 이름, 월급을 조회하라.

select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

select last_name, salary
from employees
where salary between 2500 and 3500; --범위를 나타낸다 이상, 이하를 실선의 형태로 나타낸다.

select last_name
from employees
where last_name between 'King' and 'Smith'; -- char type의 범위값

-- 과제: 'King' 사원의 first_name, last_name, 직업, 월급을 조회하라.
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201); --점선으로 이루어진 느낌이다.

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or 
    manager_id = 101 or
    manager_id = 201; -- 위에 statement 와 뜻이 같다.
    
select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

select last_name
from employees
where last_name like 'S%'; -- 검색기능에서 like 연산자를 쓸것이다.

select last_name
from employees
where last_name like '%r';

-- 과제: 이름에 s 가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%s%';

-- 과제: 2005년에 입사한 사원들의 이름, 입사일을 조회하라.
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like 'K___';

--과제: 이름의 두번째 글자가 o 인 사원의 이름을 조회하라.
select last_name
from employees
where last_name like '_o%';

select job_id
from employees;

select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\'; -- escape 뒤에 오는 것을 문자로 바꿔준다?

select last_name, job_id
from employees
where job_id like 'I_[_%' escape '[';

-- 과제: 직업에 _R이 포함된 사원들의 이름, 직업을 조회하라.
select last_name, job_id
from employees
where job_id like '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

select last_name, manager_id
from employees
where manager_id = null;

select last_name, manager_id
from employees
where manager_id is null; --null 값을 찾는 방법, field value의 null값을 true로 return 받고싶을때.

select last_name, job_id, salary
from employees
where salary >= 5000 and job_id like '%IT%';

select last_name, job_id, salary
from employees
where salary >= 5000 or job_id like '%IT%';

-- 과제: 월급이 $5000 이상 %12000 이하이다. 그리고,
--       20번이나 50번 부서에서 일한다.
--       위 사원들의 이름, 월급, 부서번호를 조회하라.

select last_name, salary, department_id
from employees
where (salary between 5000 and 12000) and
    department_id in (20, 50);

-- 과제: 이름에 a와 e가 포함된 사원들의 이름을 조회하라.

select last_name
from employees
where last_name like '%a%' and
    last_name like '%e%';

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'SA_REP'); -- not 을 붙히면 여집합, 기준 외 나머지.

select last_name, salary
from employees
where salary not between 10000 and 15000;

select last_name, job_id
from employees
where job_id not like '%IT%';

select last_name, job_id
from employees
where commission_pct is not null;

select last_name, salary
from employees
where not (manager_id is null and salary >= 20000);

-- 과제: 직업이 영업이다. 그리고, 월급이 $2500, %3500가 아니다.
--      위 사원들의 이름, 직업 월급을 조회하라.

select last_name, job_id, salary
from employees
where job_id like 'SA%' and
        salary not in (2500, 3500);
        
select last_name, department_id
from employees
order by department_id; -- 정렬 방법, 오름차순 정렬이 기본값이다.

select last_name, department_id
from employees
order by department_id desc; -- 내림차순 정렬방법.

select last_name, department_id
from employees
order by 2;

select last_name, department_id dept_id --별명은 db안에 없다. 그래도 order by는 사용가능하다.
from employees
order by dept_id; -- 별명으로도 정렬가능.

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;