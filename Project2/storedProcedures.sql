set serveroutput on;

CREATE OR REPLACE PROCEDURE GPAs
AS
GPAlist SYS_REFCURSOR;
BEGIN
OPEN GPAlist FOR
SELECT P.pid, P.name, T.gpa
FROM Person P, Student S, Views V, Transcript T
WHERE P.pid = S.pid AND S.pid = V.pid AND V.tid = T.tid;
DBMS_SQL.RETURN_RESULT(GPAlist);
END;

EXEC GPAs;


CREATE OR REPLACE PROCEDURE WhoEarned (N IN CHAR)
AS
Earned SYS_REFCURSOR;
BEGIN
OPEN Earned FOR
SELECT DISTINCT P.pid, P.name, FE.course_name, FG.grade
FROM Person P, Student S, Final_Grade FG, Final_Exam FE, Course C
WHERE P.pid = S.pid AND S.pid = FG.pid AND FG.eid = FE.eid AND FG.grade = N;
DBMS_SQL.RETURN_RESULT(Earned);
END;

EXEC WhoEarned ('grade');


CREATE OR REPLACE PROCEDURE ExamTakers (N IN CHAR) AS
Exam SYS_REFCURSOR;
BEGIN
OPEN Exam FOR
SELECT DISTINCT P.pid, P.name
FROM Person P, Student S, Final_Exam FE, Registers R, Takes T
WHERE P.pid = S.pid AND S.pid = R.pid AND R.cid = T.cid AND T.eid = FE.eid AND T.eid = N;
DBMS_OUTPUT.PUT_LINE('Students taking exam ' || N || ' are:');
DBMS_SQL.RETURN_RESULT(Exam);
END;

EXEC ExamTakers('Course EID');


CREATE OR REPLACE PROCEDURE ExamTimes
AS
ExamT SYS_REFCURSOR;
BEGIN
OPEN ExamT FOR
SELECT DISTINCT C.course_name, FE.exam_date, FE.exam_time
FROM Course C, Final_exam FE, Takes T
WHERE C.cid = T.cid AND T.eid = FE.eid;
DBMS_SQL.RETURN_RESULT(ExamT);
END;

EXEC ExamTimes;


CREATE OR REPLACE PROCEDURE CheckVolunteers
AS
V SYS_REFCURSOR;
BEGIN
OPEN V FOR
SELECT DISTINCT P.pid, P.name, VW.organization
FROM Person P, Student S, Volunteers VS, Volunteer_Work VW
WHERE P.pid = S.pid AND S.pid = VS.pid AND VS.oid = VW.oid
ORDER BY VW.organization;
DBMS_SQL.RETURN_RESULT(V);
END;

EXEC CheckVolunteers;
