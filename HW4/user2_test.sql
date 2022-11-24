--Create AGE table that references to Veterinarian table
CREATE TABLE AGE(
    vid integer,
    vAge integer,
    PRIMARY KEY(vid),
    FOREIGN KEY(vid) REFERENCES cs111111.Veterinarian(vid)
);

INSERT INTO AGE(vid, vAge) VALUES(1001, 21);
INSERT INTO AGE(vid, vAge) VALUES(1002, 23);
INSERT INTO AGE(vid, vAge) VALUES(1003, 27);
INSERT INTO AGE(vid, vAge) VALUES(1004, 24);
INSERT INTO AGE(vid, vAge) VALUES(1005, 19);


--Create view from table cs222222
CREATE OR REPLACE VIEW Age_View
AS SELECT vid, vAge
FROM Age;

--Grant permission to cs111111
GRANT SELECT, UPDATE ON Age_View TO cs111111;


--Test permissions given by cs111111 to cs222222

--Insert into Veterinarian new values
INSERT INTO cs111111.Veterinarian(vid, vName) VALUES(1006, 'Blake.H');
INSERT INTO cs111111.Veterinarian(vid, vName) VALUES(1007, 'Brandon.N');

--Delete values from Veterinarian
DELETE FROM cs111111.Veterinarian WHERE vid = '1006';
DELETE FROM cs111111.Veterinarian WHERE vid = '1007';

--Find person that between 20 and 25 by join Age table in cs222222 with Veterinarian table in cs111111
SELECT vName, vAge
FROM cs111111.Veterinarian, Age
WHERE cs111111.veterinarian.vid = Age.vid
AND Age BETWEEN 20 AND 25;


--Revoke permission by cs111111
REVOKE UPDATE ON Age_View FROM cs111111;

--Test if permissions were revoked

--Update VIEW(View_Age) with new values
UPDATE cs222222.Age_View SET vAge = 26 WHERE vid = 1003;
UPDATE cs222222.Age_View SET vAge = 29 WHERE vid = 1005;
