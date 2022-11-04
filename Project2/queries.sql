--students registered in csci 411 who volunteered more than 5 hours
SELECT S.pid, R.cid, V.hours_worked
FROM student S, registers R, volunteers V
WHERE S.pid = R.pid AND R.pid = V.pid 
                    AND R.cid = 'CSCI411' 
                    AND V.hours_worked > 5;
                    
--professors pid that teach csci301
SELECT P.pid
FROM professor P
WHERE EXISTS (SELECT T.pid, T.cid 
              FROM teaches T 
              WHERE P.pid = T.pid AND T.cid = 'CSCI301');

--find average hours of volunteers who park in 'N lot'
SELECT AVG(V.hours_worked)
FROM volunteers V, parks P, parking K
WHERE V.pid = P.pid AND
      P.permit_id = K.permit_id AND
      K.lot_name = 'N Lot';
  
-- find the pid of students that have a gpa of a 'B' average or worse
SELECT V.pid
FROM views V, transcript T
WHERE V.tid = T.tid AND T.gpa <= 3.00
GROUP BY V.pid;
