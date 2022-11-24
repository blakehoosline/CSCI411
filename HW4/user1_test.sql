CREATE TABLE Veterinarian (
    vid integer,
    vName char(20),
    PRIMARY KEY(vid)
);

INSERT INTO Veterinarian(vid, vName)
VALUES(1001, 'Blake');
INSERT INTO Veterinarian(vid, vName)
VALUES(1002, 'Brandon');
INSERT INTO Veterinarian(vid, vName)
VALUES(1003, 'Romeo');
INSERT INTO Veterinarian(vid, vName)
VALUES(1004, 'Joshua');
INSERT INTO Veterinarian(vid, vName)
VALUES(1005, 'Anushka');


--Grant permission to cs111111

--Grant SELECT on Veterinarian table
GRANT SELECT ON Veterinarian TO cs111111;

--Grant REFERENCES on Veterinarian table
GRANT REFERENCES(vid) ON Veterinarian TO cs111111;

--Grant INSERT on Veterinarian table
GRANT INSERT ON Veterinarian TO cs111111;

--Grant DELETE on Veterinarian table
GRANT DELETE ON Veterinarian TO cs111111;


--Grant permission to cs222222

--Grant Select and Insert
GRANT SELECT, INSERT, DELETE ON Veterinarian TO cs222222;

--Grant References(vid)
GRANT REFERENCES(vid) ON Veterinarian TO cs222222;


--Test permissions given by cs222222 to cs111111

--Update VIEW(View_Age) with new values
UPDATE cs222222.Age_View SET vAge = 20 WHERE vid = 1006;
UPDATE cs222222.Age_View SET vAge = 22 WHERE vid = 1001;

--Find person name of the person from vid = 1003
SELECT vid, vName
FROM Veterinarian, cs222222.View_Age
WHERE Veterinarian.vid = cs222222.View_Age.vid
AND vid = 1003;



--Revoke permission from cs222222
REVOKE INSERT, DELETE ON Veterinarian FROM cs222222;


--Test if permissions were revoked

--Insert into Veterinarian new values
INSERT INTO cs111111.Veterinarian(vid, vName) VALUES(1008, 'Blake.No');
INSERT INTO cs111111.Veterinarian(vid, vName) VALUES(1009, 'Brandon.No');

--2.Delete values from Veterinarian
DELETE FROM cs111111.Veterinarian WHERE vid = '1002';
DELETE FROM cs111111.Veterinarian WHERE vid = '1004';
