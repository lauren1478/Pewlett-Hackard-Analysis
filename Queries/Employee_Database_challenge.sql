--Deliverable 1
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    ti.title,
    ti.to_date,
	ti.from_date
into retirement_titles
	FROM employees as e
	LEFT JOIN titles as ti
	ON e.emp_no = ti.emp_no
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY e.emp_no; 

--Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title

    into unique_titles
    FROM retirement_titles as rt
    WHERE rt.to_date = '9999-01-01'
    ORDER BY rt.emp_no, rt.to_date DESC;
 
--number of employees about to retire
SELECT COUNT(ut.title), ut.title
    into retiring_titles
    FROM unique_titles as ut
    GROUP BY ut.title
    order by count desc;

--Deliverable 2
--determining retirement elligibility
SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
	
    FROM employees as e
    LEFT JOIN department_employees as de ON e.emp_no = de.emp_no
    left join titles as ti ON e.emp_no = ti.emp_no
    WHERE de.to_date = '9999-01-01' and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    order by e.emp_no