create database Hospital

CREATE TABLE PACIENTE (
    dni VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F', 'O')) NOT NULL -- 'M' para masculino, 'F' para femenino, 'O' para otro
);

CREATE TABLE MEDICO ( 
matricula INT PRIMARY KEY,
dni VARCHAR(10) UNIQUE NOT NULL, 
nombre NVARCHAR(50) NOT NULL, 
apellido NVARCHAR(50) NOT NULL, 
cuitCuil VARCHAR(13) UNIQUE NOT NULL, 
foto VARBINARY(MAX), -- Se permite almacenar una imagen de max 2GB
fechaIngreso DATE NOT NULL,
maxGuardias INT CHECK (maxGuardias  >= 0), -- Asegura un valor no negativo
);

CREATE TABLE INTERNACION (
idInternacion INT PRIMARY KEY,  -- Clave primaria
fechaInicio DATE NOT NULL,
fechaFin DATE,  -- Puede ser nulo
dniPaciente INT NOT NULL,  -- Clave foránea a PACIENTE
matricula INT NOT NULL,  -- Clave foránea a MEDICO
);

CREATE TABLE HABITACION (
    nroHabitacion INT PRIMARY KEY,
    idSector INT NOT NULL,
    nroPiso INT NOT NULL,
    orientacion VARCHAR(50) NOT NULL
);
ALTER TABLE HABITACION
ADD CONSTRAINT FK_SECTOR FOREING KEY (idSector) REFERENCES Sector(idSector)"