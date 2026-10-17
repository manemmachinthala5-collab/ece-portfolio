
-- Library Management System
-- SQL Assignment

-- Create Books table
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    total_copies INTEGER,
    available_copies INTEGER
);

-- Create Members table
CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY,
    member_name VARCHAR(100)
);

-- Create Issues table
CREATE TABLE Issues (
    issue_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert sample books
INSERT INTO Books VALUES
(1, 'Database Systems', 'Navathe', 5, 3),
(2, 'Computer Networks', 'Tanenbaum', 4, 4),
(3, 'Operating Systems', 'Galvin', 3, 2),
(4, 'Digital Electronics', 'Morris Mano', 5, 5),
(5, 'SQL Basics', 'John Smith', 4, 2);

-- Insert members
INSERT INTO Members VALUES
(101, 'Anu'),
(102, 'Ravi'),
(103, 'Priya'),
(104, 'Kiran');

-- Insert issue records
INSERT INTO Issues VALUES
(1, 1, 101, '2026-09-01', '2026-09-15', '2026-09-12'),
(2, 3, 102, '2026-09-10', '2026-09-24', NULL),
(3, 1, 103, '2026-09-15', '2026-09-29', NULL),
(4, 5, 101, '2026-09-20', '2026-10-04', NULL),
(5, 5, 101, '2026-09-25', '2026-10-09', '2026-10-05');

-- Task 1: Find overdue books
SELECT b.book_id, b.title, i.due_date
FROM Books b
JOIN Issues i ON b.book_id = i.book_id
WHERE i.return_date IS NULL
AND i.due_date < DATE('now');

-- Task 2: Find books never issued
SELECT b.book_id, b.title
FROM Books b
LEFT JOIN Issues i ON b.book_id = i.book_id
WHERE i.book_id IS NULL;

-- Task 3: Find member who borrowed maximum books
SELECT m.member_id, m.member_name, COUNT(*) AS books_borrowed
FROM Members m
JOIN Issues i ON m.member_id = i.member_id
GROUP BY m.member_id, m.member_name
ORDER BY books_borrowed DESC
LIMIT 1;

-- Task 4: Find most popular book
SELECT b.book_id, b.title, COUNT(*) AS times_issued
FROM Books b
JOIN Issues i ON b.book_id = i.book_id
GROUP BY b.book_id, b.title
ORDER BY times_issued DESC
LIMIT 1;

-- Task 5: Count available books
SELECT SUM(available_copies) AS available_books
FROM Books;
