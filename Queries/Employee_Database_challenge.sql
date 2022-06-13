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