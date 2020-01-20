USE test_company;

-- 1. ¬ывести список сотрудников, получающих заработную плату большую, чем у 
-- непосредственного руководител€ 

SELECT e.ID, e.Department_ID, e.Name, e.SALARY, e.Chief_ID
FROM Employee AS e
LEFT JOIN Employee AS chief ON chief.ID = e.Chief_ID
WHERE e.SALARY >= chief.SALARY;

-- 2. ¬ывести список сотрудников, получающих максимальную заработную плату в 
-- своем отделе, отсортированный по убыванию размера заработной платы.

SELECT e.Name, d.Name AS 'Department', e.SALARY
FROM Employee AS e
LEFT JOIN Department AS d ON e.Department_ID = d.ID
WHERE SALARY = (
	SELECT MAX(e2.SALARY)
	FROM Employee AS e2
	WHERE e.Department_ID = e2.Department_ID)
ORDER BY e.SALARY DESC;

-- 3. ¬ывести список ID отделов, 
-- количество сотрудников в которых меньше 3-х человек

SELECT d.ID --, d.Name, COUNT(e.ID) AS 'Count'
FROM Department AS d
LEFT JOIN Employee AS e ON e.Department_ID = d.ID
GROUP BY d.ID, d.Name
HAVING COUNT(e.ID) < 3;

-- 4. ¬ывести список ID руководителей, заработна€ плата которых больше или 
-- равна суммарной заработной платы их подчиненных.

SELECT e.ID --, e.Name, e.SALARY 
FROM Employee AS e
WHERE e.SALARY >= (
	SELECT SUM(e2.Salary) 
	FROM Employee AS e2 
	WHERE e2.Chief_ID = e.ID);

-- 5. Ќайти список наименований отделов с
-- минимальной суммарной зарплатой сотрудников

WITH Department_salary AS (
	SELECT Department_ID, sum(SALARY) AS salary
    FROM   Employee
    GROUP BY Department_ID )
SELECT Department_ID
FROM Department_salary AS ds       
WHERE  ds.salary = (
	SELECT MIN(salary) 
	FROM Department_salary);

-- 6. ¬ывести имена агентов, совершавших платежи с 01.05.2016 по 20.05.2016,
-- и сумму последнего (в этом периоде) платежа агента.

SELECT a.Name, p.Val
FROM Agents AS a
LEFT JOIN Payment AS p ON a.AgentID = p.AgentExt
WHERE p.Dte IN (
	SELECT MAX(Dte)
	FROM Payment
	WHERE Dte > '2016-05-01' AND Dte < '2016-05-20'
	GROUP BY AgentExt);

-- 7. ¬ывести имена агентов, по которым нет платежей 166-го типа.
-- Ѕез использовани€ подзапросов, только соединение таблиц.

SELECT a.Name
FROM Agents AS a
LEFT JOIN Payment AS p ON p.AgentExt = a.AgentID
WHERE p.PType != 166
GROUP BY a.Name;

-- 8. Ќайти платежи агентов, наименование которых начинаетс€ на Ђбанкї 
-- (независимо от регистра символов) и вывести их в пор€дке возрастани€ даты
-- платежа. Ќужно вывести наименование агента, дату платежа, сумму платежа,
-- сумму предыдущего (по дате) платежа этого агента.

SELECT 
	a.Name, p.Dte, p.Val
	, LAG(p.Val) OVER(PARTITION BY a.Name ORDER BY p.Dte) AS 'Prev Val'
FROM Payment AS p
LEFT JOIN Agents AS a ON p.AgentExt = a.AgentID
WHERE lower(a.Name) LIKE 'банк%'
ORDER BY p.Dte ASC;