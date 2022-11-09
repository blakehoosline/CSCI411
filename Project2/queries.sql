--this query finds the students registered in csci 411 who volunteered more than 5 hours
SELECT S.pid, R.cid, V.hours_worked
FROM student S, registers R, volunteers V
WHERE S.pid = R.pid AND R.pid = V.pid 
                    AND R.cid = 'CSCI411' 
                    AND V.hours_worked > 5;
                    
--this query finds the pid of professors that teach csci301
SELECT P.pid
FROM professor P
WHERE EXISTS (SELECT T.pid, T.cid 
              FROM teaches T 
              WHERE P.pid = T.pid AND T.cid = 'CSCI301');

-- this query finds average hours of volunteers who park in 'N lot'
SELECT AVG(V.hours_worked)
FROM volunteers V, parks P, parking K
WHERE V.pid = P.pid AND
      P.permit_id = K.permit_id AND
      K.lot_name = 'N Lot';
  
--this query finds the pid of students that have a gpa of a 'B' average or worse
SELECT V.pid
FROM views V, transcript T
WHERE V.tid = T.tid AND T.gpa <= 3.00
GROUP BY V.pid;

--this query finds the email of students who have taken a final exam in the month of December 
SELECT a.email 
FROM assigned a, course c, final_exam f, registers r 
WHERE a.pid = r.pid AND r.cid = c.cid AND c.course_name = f.course_name AND f.exam_date LIKE '%DEC%'; 

--this query finds the names of students who's email has been created in the year of 2022 
SELECT p.name 
FROM person p, student s, assigned a, email_address e 
WHERE p.pid = s.pid AND s.pid = a.pid AND a.email = e.email AND e.creation LIKE '%-22';

--this query finds the amount of the students who have classes in ECC 
SELECT COUNT(*) 
FROM student s, registers r, course c, assigned_to a 
WHERE s.pid = r.pid AND r.cid = c.cid AND c.cid = a.cid AND a.building = 'ECC'; 

--this query finds the organization(s) that had student(s) that volunteered who had a GPA of 4.0
SELECT DISTINCT vw.organization 
FROM volunteer_work vw, volunteers vs, views vi, transcript t 
WHERE vw.oid = vs.oid AND vs.pid = vi.pid AND vi.tid = t.tid AND t.gpa = 4.0;

--this query finds the names of students who are currently failing the GPA graduation requirement of 2.50 
SELECT P.pid, P.name 
FROM Person P, Student S, views V, transcript T   
WHERE P.pid = S.pid AND S.pid = V.pid AND V.tid = T.tid AND T.gpa < 2.50

--this query finds the number of registered cars in each lot. 
SELECT DISTINCT P.Lot_name, COUNT(P.Lot_name) AS Registered 
FROM Parking P  
GROUP BY (P.lot_name, P.Lot_name); 
