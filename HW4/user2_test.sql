--Create AGE table that references to Veterinarian table
CREATE TABLE AGE(
    vid integer,
    vAge integer,
    PRIMARY KEY(vid),
    FOREIGN KEY(vid) REFERENCES cs411137.Veterinarian(vid)
);

INSERT INTO AGE(vid, vAge) VALUES(1001, 21);
INSERT INTO AGE(vid, vAge) VALUES(1002, 23);
INSERT INTO AGE(vid, vAge) VALUES(1003, 27);
INSERT INTO AGE(vid, vAge) VALUES(1004, 24);
INSERT INTO AGE(vid, vAge) VALUES(1005, 19);


--Create view from table cs411140
CREATE OR REPLACE VIEW Age_View
AS SELECT vid, vAge
FROM Age;

--Grant permission to cs411137
GRANT SELECT, UPDATE ON Age_View TO cs411137;


--Test permissions given by cs411137 to cs411140

--Insert into Veterinarian new values
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1006, 'Blake.H');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1007, 'Brandon.N');

--Delete values from Veterinarian
DELETE FROM cs411137.Veterinarian WHERE vid = '1006';
DELETE FROM cs411137.Veterinarian WHERE vid = '1007';

--Find person that between 20 and 25 by join Age table in cs411140 with Veterinarian table in cs411137
SELECT vName, vAge
FROM cs411137.Veterinarian, Age
WHERE cs411137.veterinarian.vid = Age.vid
AND Age BETWEEN 20 AND 25;


--Revoke permission by cs411137
REVOKE UPDATE ON Age_View FROM cs411137;

--Test if permissions were revoked


--Insert into Veterinarian new values
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1008, 'Blake.No');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1009, 'Brandon.No');

--Delete values from Veterinarian
DELETE FROM cs411137.Veterinarian WHERE vid = '1002';
DELETE FROM cs411137.Veterinarian WHERE vid = '1004';
