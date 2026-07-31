Use HR;


-- Five aggregates in one row


SELECT COUNT(salary) AS n_emps, 
		MIN(salary) AS lowest, 
		MAX(salary) AS highest, AVG(salary) AS avg_pay, 
		SUM(salary) AS total_payroll 
FROM dbo.EMPLOYEES;



-- COUNT(DISTINCT) — how many departments


SELECT COUNT(DISTINCT dept_id) AS n_depts 
FROM dbo.EMPLOYEES;

SELECT COUNT(*)
FROM DEPARTMENTS



-- Average salary per department


SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_pay 
FROM dbo.EMPLOYEES 
GROUP BY dept_id
ORDER BY avg_pay DESC;


SELECT * FROM DEPARTMENTS


-- Headcount per department


SELECT dept_id, COUNT(dept_id) AS headcount 
FROM dbo.EMPLOYEES 
GROUP BY dept_id 
ORDER BY headcount DESC;



-- WHERE + HAVING together


SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_pay 
FROM dbo.EMPLOYEES 
WHERE hire_date >= '2015-01-01' 
GROUP BY dept_id 
HAVING AVG(salary) > 100000 
ORDER BY avg_pay DESC;


-- Departments with > 700 employees


SELECT dept_id, COUNT(*) AS headcount 
FROM dbo.EMPLOYEES 
GROUP BY dept_id 
HAVING COUNT(*) > 700 
ORDER BY headcount DESC;


-- Non-aggregated-column rule fix — MAX(name)

SELECT * FROM Employees

SELECT dept_id, name
FROM EMPLOYEES
GROUP BY dept_id



SELECT dept_id, MAX(name) AS a_sample_name, AVG(salary) AS avg_pay 
FROM dbo.EMPLOYEES 
GROUP BY dept_id 
ORDER BY avg_pay DESC;


SELECT dept_id, job_id, AVG(salary)
FROM EMPLOYEES
GROUP BY dept_id

SELECT dept_id, job_id, AVG(salary)
FROM EMPLOYEES
GROUP BY dept_id , job_id
ORDER BY dept_id, job_id

SELECT dept_id, MAX(job_id), AVG(salary)
FROM EMPLOYEES
GROUP BY dept_id