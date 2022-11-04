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

--enter a grade here such as 'A'
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

--enter a course id here such as 'E11'
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

CREATE OR REPLACE PROCEDURE Students 
AS
Students SYS_REFCURSOR;
BEGIN
OPEN Students FOR
SELECT DISTINCT P.pid, P.name
FROM Person P, Student S
WHERE P.pid = S.pid;
DBMS_SQL.RETURN_RESULT(Students);
END;

EXEC Students;

CREATE OR REPLACE PROCEDURE SemesterClass (N IN CHAR) AS
f Char(15);
BEGIN
SELECT DISTINCT C.semester INTO f
FROM Course C
WHERE C.cid = N;
DBMS_OUTPUT.PUT_LINE(N || ' is available for the semester of ' || f);
END;

EXEC SemesterClass('Course CID'):
EXAMPLE EXEC SemesterClass('CSCI301'):


CREATE OR REPLACE PROCEDURE EmailFind (N IN CHAR) AS
f Char(30);
BEGIN
SELECT DISTINCT E.email INTO f
FROM Person P, Student S, Assigned A, Email_address E
WHERE P.pid = S.pid AND S.pid = A.pid AND A.email = E.email AND P.name = N;
DBMS_OUTPUT.PUT_LINE(N || ' has an email address of ' || f);
END;

EXEC EmailFind('Student Name');
EXAMPLE EXEC EmailFind('Mark');


CREATE OR REPLACE PROCEDURE LotCarOwner (N IN CHAR)
AS
Cars SYS_REFCURSOR;
BEGIN
OPEN Cars FOR
SELECT DISTINCT PK.pid, P.car_model
FROM Parking P, Parks PK
WHERE P.lot_name = N AND PK.permit_id = P.permit_id;
DBMS_SQL.RETURN_RESULT(Cars);
END;

EXEC LotCarOwner('Lot');
EXAMPLE EXEC LotCarOwner('E Lot');


CREATE OR REPLACE PROCEDURE Teachers
AS
Teacher SYS_REFCURSOR;
BEGIN
OPEN Teacher FOR
SELECT DISTINCT P.pid, P.name
FROM Person P, Professor T
WHERE P.pid = T.pid;
DBMS_SQL.RETURN_RESULT(Teacher);
END;

EXEC Teachers;
