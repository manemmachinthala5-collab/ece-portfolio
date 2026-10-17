-- Student Result Management System
-- SQL Assignment

-- Create Students table
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Create Results table
CREATE TABLE Results (
    student_id INTEGER,
    DBMS INTEGER,
    Networks INTEGER,
    Operating_Systems INTEGER,
    Digital_Electronics INTEGER,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert student details
INSERT INTO Students VALUES
(1, 'Anu'),
(2, 'Ravi'),
(3, 'Priya'),
(4, 'Kiran'),
(5, 'Divya');

-- Insert marks
INSERT INTO Results VALUES
(1, 92, 88, 85, 90),
(2, 78, 82, 75, 80),
(3, 96, 91, 94, 89),
(4, 35, 72, 68, 76),
(5, 85, 84, 83, 82);

-- Task 1: Find the topper in DBMS
SELECT Students.student_name, Results.DBMS
FROM Students
INNER JOIN Results
ON Students.student_id = Results.student_id
ORDER BY Results.DBMS DESC
LIMIT 1;

-- Task 2: Find students scoring above 80 in all subjects
SELECT s.student_id, s.student_name
FROM Students s
JOIN Results r
ON s.student_id = r.student_id
WHERE r.DBMS > 80
  AND r.Networks > 80
  AND r.Operating_Systems > 80
  AND r.Digital_Electronics > 80;

-- Task 3: Calculate average marks of each subject
SELECT
    ROUND(AVG(DBMS), 2) AS DBMS_Average,
    ROUND(AVG(Networks), 2) AS Networks_Average,
    ROUND(AVG(Operating_Systems), 2) AS OS_Average,
    ROUND(AVG(Digital_Electronics), 2) AS DE_Average
FROM Results;

-- Task 4: Find students who failed
-- Assumption: Marks below 40 in any subject are considered a fail.
SELECT s.student_id, s.student_name
FROM Students s
JOIN Results r
ON s.student_id = r.student_id
WHERE r.DBMS < 40
   OR r.Networks < 40
   OR r.Operating_Systems < 40
   OR r.Digital_Electronics < 40;

-- Task 5: Display CGPA
-- Assumption: CGPA = Average percentage / 10
SELECT
    s.student_id,
    s.student_name,
    ROUND(
        (r.DBMS + r.Networks + r.Operating_Systems +
         r.Digital_Electronics) / 40.0,
        2
    ) AS CGPA
FROM Students s
JOIN Results r
ON s.student_id = r.student_id;
