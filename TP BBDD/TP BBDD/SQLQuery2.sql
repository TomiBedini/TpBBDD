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
idInternacion INT IDENTITY(1,1) PRIMARY KEY,  -- Clave primaria
fechaInicio DATE NOT NULL,
fechaFin DATE,  -- Puede ser nulo
dniPaciente INT NOT NULL,  -- Clave for�nea a PACIENTE
matricula INT NOT NULL,  -- Clave for�nea a MEDICO
);


CREATE TABLE SECTOR (
    idSector INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);



CREATE TABLE HABITACION (
    nroHabitacion INT PRIMARY KEY,
    idSector INT NOT NULL,
    nroPiso INT NOT NULL,
    orientacion VARCHAR(50) NOT NULL
);
ALTER TABLE HABITACION
ADD CONSTRAINT FK_SECTOR FOREIGN KEY (idSector) REFERENCES Sector(idSector)




CREATE TABLE CAMA (
nroHabitacion INT NOT NULL,
nroCama INT NOT NULL CHECK (nroCama BETWEEN 1 AND 10),
estado BIT NOT NULL,
PRIMARY KEY (nroHabitacion, nroCama)
);
ALTER TABLE CAMA
ADD CONSTRAINT FK_NRO_HABITACION FOREIGN KEY (nroHabitacion) REFERENCES HABITACION(nroHabitacion)




CREATE TABLE RONDA (
idRonda INT PRIMARY KEY,
);




CREATE TABLE RECORRIDO (
idRecorrido INT IDENTITY(1,1) PRIMARY KEY,
fecha DATE,
matricula INT,
idRonda INT,
);

ALTER TABLE RECORRIDO
ADD CONSTRAINT FK_MATRICULA FOREIGN KEY (matricula) REFERENCES MEDICO(matricula)
ALTER TABLE RECORRIDO
ADD CONSTRAINT FK_RONDA FOREIGN KEY (idRonda) REFERENCES RONDA(idRonda)     

CREATE TABLE COMENTARIO (
idComentario INT IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR(500) NOT NULL,
);



CREATE TABLE guardia (
idGuardia INT IDENTITY(1,1) PRIMARY KEY,
horario CHAR(1) NOT NULL, --M T N
fecha DATE NOT NULL,
);



CREATE TABLE ESPECIALIDAD (
idEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
nombreEspecialidad VARCHAR(50) NOT NULL
);



CREATE TABLE VACACION (
matricula INT NOT NULL UNIQUE,
idVacacion INT IDENTITY(1,1) NOT NULL,
fechaInicio DATE NOT NULL,
fechaFin DATE NOT NULL,
PRIMARY KEY (Matricula, idVacacion)
);
ALTER TABLE VACACION
ADD CONSTRAINT FK_MATRICULA_VACACION FOREIGN KEY (matricula) REFERENCES MEDICO(matricula) ON DELETE CASCADE




CREATE TABLE USUARIO(
idUsuario INT IDENTITY(1,1) PRIMARY KEY,
nombreUsuario VARCHAR(50)
);




CREATE TABLE operacion (
idoperacion INT IDENTITY(1,1) PRIMARY KEY,
tipo VARCHAR(30) NOT NULL,
observaciones NVARCHAR(500) NOT NULL,
);




CREATE TABLE SE_ASIGNA (
idInternacion INT NOT NULL UNIQUE,
nroHabitacion INT NOT NULL UNIQUE,
nroCama INT NOT NULL UNIQUE,
fecha DATE NOT NULL,
hora TIME NOT NULL,
PRIMARY KEY (idInternacion, nroHabitacion, nroCama, Fecha, Hora),
);

ALTER TABLE SE_ASIGNA
ADD CONSTRAINT FK_INTERNACION FOREIGN KEY (idInternacion) REFERENCES INTERNACION(idInternacion) ON DELETE CASCADE
ALTER TABLE SE_ASIGNA
ADD CONSTRAINT FK_CAMA FOREIGN KEY (nroCama, nroHabitacion) REFERENCES CAMA(nroHabitacion, nroCama) ON DELETE CASCADE






CREATE TABLE ES_VISITADA (
nroHabitacion INT NOT NULL UNIQUE,
idRonda INT NOT NULL UNIQUE,
dia VARCHAR(10) NOT NULL,
turno INT NOT NULL,
PRIMARY KEY (nroHabitacion, idRonda),
);

ALTER TABLE  ES_VISITADA 
ADD CONSTRAINT FK_HABITACION_EV FOREIGN KEY (nroHabitacion) REFERENCES HABITACION(nroHabitacion) ON DELETE CASCADE
ALTER TABLE  ES_VISITADA 
ADD CONSTRAINT FK_RONDA_EV FOREIGN KEY (idRonda) REFERENCES RONDA(idRonda) ON DELETE CASCADE






CREATE TABLE SE_ESPECIALIZA_EN (
matricula INT NOT NULL UNIQUE,
idEspecialidad INT NOT NULL UNIQUE,
PRIMARY KEY (matricula, idEspecialidad),
);

ALTER TABLE SE_ESPECIALIZA_EN
ADD CONSTRAINT FK_MATRICULA_SEE FOREIGN KEY (matricula) REFERENCES MEDICO(matricula) ON DELETE CASCADE
ALTER TABLE SE_ESPECIALIZA_EN
ADD CONSTRAINT FK_ESPECIALIDAD_SEE FOREIGN KEY (idEspecialidad) REFERENCES ESPECIALIDAD(idEspecialidad) ON DELETE CASCADE





CREATE TABLE CONFORMA (
idEspecialidad INT NOT NULL UNIQUE,
matricula INT NOT NULL UNIQUE,
idGuardia INT NOT NULL UNIQUE,
PRIMARY KEY (idEspecialidad, matricula, idGuardia),
);

ALTER TABLE CONFORMA
ADD CONSTRAINT FK_GUARDIA_CONFORMA FOREIGN KEY (idGuardia) REFERENCES GUARDIA(idGuardia) ON DELETE CASCADE
ALTER TABLE CONFORMA
ADD CONSTRAINT FK_SEE_CONFORMA FOREIGN KEY (matricula, idEspecialidad) REFERENCES SE_ESPECIALIZA_EN(matricula, idEspecialidad) ON DELETE CASCADE





CREATE TABLE ES_FORMULADO_EN (
idRecorrido INT NOT NULL UNIQUE,
idInternacion INT NOT NULL UNIQUE,
idComentario INT NOT NULL UNIQUE,
PRIMARY KEY (idRecorrido, idInternacion)
);

ALTER TABLE ES_FORMULADO_EN
ADD CONSTRAINT FK_ES_FORMULADO_EN_RECORRIDO
FOREIGN KEY (idrecorrido) REFERENCES RECORRIDO(idrecorrido) ON DELETE CASCADE;

ALTER TABLE ES_FORMULADO_EN
ADD CONSTRAINT FK_ES_FORMULADO_EN_INTERNACION
FOREIGN KEY (idinternacion) REFERENCES INTERNACION(idinternacion) ON DELETE CASCADE;

ALTER TABLE ES_FORMULADO_EN
ADD CONSTRAINT FK_ES_FORMULADO_EN_COMENTARIO
FOREIGN KEY (idcomentario) REFERENCES COMENTARIO(idcomentario) ON DELETE CASCADE;






CREATE TABLE ES_ASIGNADA_POR (
idguardia INT NOT NULL UNIQUE,
idusuario INT NOT NULL UNIQUE,
idoperacion INT NOT NULL UNIQUE,
PRIMARY KEY (idguardia, idusuario, idoperacion)
);

ALTER TABLE ES_ASIGNADA_POR
ADD CONSTRAINT FK_ES_ASIGNADA_POR
FOREIGN KEY (idguardia) REFERENCES Guardia(idguardia) ON DELETE CASCADE;

ALTER TABLE ES_ASIGNADA_POR
ADD CONSTRAINT FK_ES_ASIGNADA_POR_USUARIO
FOREIGN KEY (idusuario) REFERENCES Usuario(idusuario) ON DELETE CASCADE;

ALTER TABLE ES_ASIGNADA_POR
ADD CONSTRAINT FK_ES_ASIGNADA_POR_OPERACION
FOREIGN KEY (idoperacion) REFERENCES Operacion(idoperacion) ON DELETE CASCADE;