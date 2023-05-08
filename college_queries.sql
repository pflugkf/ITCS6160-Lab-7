#Question 1: Write a query to find the lowest and highest GPA of students applying to CS
SELECT MIN(gpa) AS lowest_CS_GPA, MAX(gpa) AS highest_CS_GPA FROM student 
WHERE sID IN (SELECT DISTINCT sID FROM apply WHERE major = 'CS');

#Question 2: Write a query to find the spread of GPAs
SELECT MAX(gpa) - MIN(gpa) AS GPA_spread FROM student;

#Question 3: Write a query to find the minimum and maximum GPAs of applicants to each 
# college and major
SELECT cName, major, MIN(GPA) AS min_gpa, MAX(GPA) AS max_gpa FROM student, apply
WHERE student.sID = apply.sID
GROUP BY cName, major
ORDER BY cName;

#Question 4: Write a query to find the total college enrollments by state
SELECT state, SUM(enrollment) FROM college GROUP BY state;

#Question 5: Write a query to find the average GPA of students who applied to CS
SELECT AVG(gpa) FROM student 
JOIN (SELECT DISTINCT sID FROM apply WHERE major = 'CS') AS CS_GPAs
ON student.sID = CS_GPAs.sID;

#Question 6: Write a query to find the amount by which the average GPA of students
# applying to CS exceeds the average of students not applying to CS
SELECT CS_GPA.avgGPA - NotCS_GPA.avgGPA AS avg_gpa_difference
FROM (SELECT AVG(GPA) AS avgGPA FROM student 
		WHERE sID in (SELECT sID FROM apply WHERE major = 'CS')) AS CS_GPA,
     (SELECT AVG(GPA) as avgGPA FROM student 
		WHERE sID not in (SELECT sID FROM apply WHERE major = 'CS')) AS NotCS_GPA;
        
#Question 7: Write a query to find the number of rows in the Student table
SELECT COUNT(*) AS numRows FROM student;

#Question 8: Write a query to find the number of distinct students applying to Cornell
SELECT COUNT(DISTINCT sID) AS Cornell_applicants FROM apply WHERE cName = 'Cornell';

#Question 9a: Write a query to return each student's sid and the number of colleges 
# that the student has applied to.
SELECT sID, COUNT(DISTINCT cName) AS numCollegesAppliedTo FROM apply
GROUP BY sID;

#Question 9b: Write a query to find the name, sid of each student, and the number of 
# colleges that he/she applied to.
SELECT student.sID, sName, COUNT(DISTINCT cName) AS numCollegesAppliedTo FROM student, apply 
WHERE student.sID = apply.sID
GROUP BY sID, sName;

#Question 10: Write a query to find the Colleges with fewer than 5 applications
SELECT cName FROM apply  
GROUP BY cName
HAVING COUNT(DISTINCT sID) < 5;

#Question 11
#SQL Script from part A:
SELECT * FROM student;

INSERT INTO student VALUES (432, 'Kevin', null, 1500);
INSERT INTO student VALUES (321, 'Lori', null, 2500);

SELECT * FROM student;

#SQL Script from part B:
SELECT COUNT(*) FROM student;

#SQL Script from part C:
SELECT COUNT(GPA) FROM student;

#Question 12
#SQL Script from part D:
SET SQL_SAFE_UPDATES = 0;
DELETE FROM student WHERE GPA IS NULL;


