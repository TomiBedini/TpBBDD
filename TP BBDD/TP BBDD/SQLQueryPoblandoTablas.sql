--poblamos tabla de pacientes
INSERT INTO PACIENTE (dni, nombre, apellido, fechaNacimiento, sexo) VALUES
('33547892', 'Juan', 'P�rez', '1981-01-15', 'M'),
('34764583', 'Ana', 'Garc�a', '1982-04-22', 'F'),
('9987654', 'Luis', 'Mart�nez', '1915-07-10', 'M'),
('22019876', 'Mar�a', 'L�pez', '1971-11-05', 'F'),
('48134567', 'Sof�a', 'Mart�n', '2010-09-18', 'O'),
('42456789', 'Carlos', 'Fern�ndez', '1999-01-20', 'M'),
('37678901', 'Valentina', 'Gonz�lez', '1986-03-25', 'F'),
('42890123', 'Diego', 'Torres', '1999-07-30', 'M'),
('17901234', 'Luc�a', 'S�nchez', '1954-11-15', 'F'),
('13567890', 'Javier', 'Cruz', '1939-06-12', 'O'),
('40234567', 'Fernando', 'Hern�ndez', '1997-02-03', 'M'),
('40456789', 'Clara', 'Vega', '1997-05-29', 'F'),
('16678901', 'Nicol�s', 'Jim�nez', '1959-10-14', 'M'),
('44345678', 'Patricia', 'Moreno', '2003-08-20', 'F'),
('30678901', 'Fernando', 'Aguero', '1980-02-20','M'),
('39567890', 'Marta', 'Benitez', '1994-09-10','F');

SELECT * FROM PACIENTE

--poblamos tabla de medicos

INSERT INTO MEDICO (matricula, dni, nombre, apellido, cuitCuil, foto, fechaIngreso, maxGuardias) VALUES
(1001, '28567890', 'Juan', 'Perez', '20285678903', 0x1234, '2015-04-23', 5),
(1002, '30789012', 'Maria', 'Gomez', '20307890121', 0x2345, '2018-06-15', 6),
(1003, '28789034', 'Luis', 'Lopez', '20287890342', 0x3456, '2019-01-05', 4),
(1004, '21890123', 'Ana', 'Diaz', '27218901232', 0x4567, '2012-08-20', 7),
(1005, '27891234', 'Carlos', 'Suarez', '20278912343', 0x5678, '2020-10-12', 3),
(1006, '21901234', 'Gabriel', 'Fernandez', '27219012344', 0x6789, '2017-03-10', 5),
(1007, '29890123', 'Lucia', 'Martinez', '20298901230', 0x789A, '2021-02-25', 6),
(1008, '30567890', 'Miguel', 'Garcia', '20305678903', 0x89AB, '2013-07-30', 4),
(1009, '31234567', 'Sofia', 'Hernandez', '27312345673', 0x9ABC, '2014-05-22', 8),
(1010, '30678901', 'Fernando', 'Aguero', '20306789011', 0xA1B2, '2013-09-13', 7),
(1011, '39567890', 'Marta', 'Benitez', '27395678905', 0xB2C3, '2019-11-14', 5);

SELECT * FROM MEDICO


--poblamos tabla internacion

INSERT INTO INTERNACION (fechaInicio, fechaFin, dniPaciente,matricula) VALUES
--('2024-01-01', '2024-01-15', '35547892',1001);
--('2024-02-01', '2024-02-10', '36764583',1005);
--('2024-03-11', NULL, '9987654',1008);
--('2024-04-01', '2024-04-11', '22019876',1009),
--('2024-05-01', NULL, '48134567', 1007);
--('2024-06-01', '2024-06-15', '42456789', 1010);
--('2024-07-01', '2024-07-14', '37678901', 1002);
--('2024-08-01', '2024-08-20', '42890123', 1009);
--('2024-09-01', '2024-09-11', '17901234', 1006);
--('2024-10-01', NULL, '13567890', 1011);
--('2024-11-01', '2024-11-12', '40234567', 1003);
--('2024-12-01', '2024-12-11', '40456789', 1008);
--('2024-01-01', NULL, '31678901', 1004);
--('2024-02-01', '2024-02-14', '31345678', 1005);
--('2024-03-01', NULL, '32678901', 1001);
--('2024-04-01', NULL, '33567890', 1002);

SELECT * FROM INTERNACION



INSERT INTO SECTOR (idSector, descripcion) VALUES
(1, 'Sector de Emergencias'),
(2, 'Sector de Maternidad'),
(3, 'Sector de Radiolog�a'),
(4, 'Sector de Cirug�a'),
(5, 'Sector de Guardia');