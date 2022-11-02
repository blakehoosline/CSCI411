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
