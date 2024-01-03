# Write your MySQL query statement below

SELECT
    s.student_id, s.student_name, su.subject_name, COUNT(e.subject_name) as attended_exams
FROM    
    Students as s CROSS JOIN Subjects as su
    LEFT JOIN Examinations as e USING(student_id, subject_name)
GROUP BY
    s.student_id, s.student_name, su.subject_name
ORDER BY
    s.student_id asc, su.subject_name asc