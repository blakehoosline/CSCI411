--Test permissions given by cs411137 to cs411139

--Insert into Veterinarian new values
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1010, 'Joe');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1011, 'Alyssa');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1012, 'Paige');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1013, 'James');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1014, 'Hailey');



--Delete values from Veterinarian
DELETE FROM cs411137.Veterinarian WHERE vid = '1010';
DELETE FROM cs411137.Veterinarian WHERE vid = '1011';
DELETE FROM cs411137.Veterinarian WHERE vid = '1012';
DELETE FROM cs411137.Veterinarian WHERE vid = '1013';
DELETE FROM cs411137.Veterinarian WHERE vid = '1014';



--Find the name of the veterinarian that has a vid of 1003 with Veterinarian table from cs411137
SELECT vName
FROM cs411137.Veterinarian
WHERE cs411137.veterinarian.vid = 1003;


--Test if permissions were revoked


--Insert into Veterinarian new values
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1008, 'Romeo1');
INSERT INTO cs411137.Veterinarian(vid, vName) VALUES(1009, 'Romeo2');

--Delete values from Veterinarian
DELETE FROM cs411137.Veterinarian WHERE vid = '1003';
DELETE FROM cs411137.Veterinarian WHERE vid = '1005';
