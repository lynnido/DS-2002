-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM students
WHERE enrollmentdate LIKE "%2023%";

-- 2. Find students whose email contains 'gmail.com'.
SELECT * FROM students
WHERE Email LIKE '%gmail.com%';

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(FirstName)
FROM Students;

-- 4. Find students born between 2000 and 2005.
SELECT StudentID, FirstName, LastName, DateOfBirth
FROM Students
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2005-12-31';

-- 5. List students sorted by last name in descending order.
SELECT * FROM Students
ORDER BY LastName DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT c.CourseID, c.CourseName, c.Credits, c.Instructor
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.EnrollmentID IS NULL;


-- 10. List courses and show the number of students enrolled in each course.
SELECT c.CourseID, c.CourseName, c.Credits, c.Instructor,
    COUNT(e.EnrollmentID) AS NumberOfStudents
FROM Courses c
LEFT JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName, c.Credits, c.Instructor;



