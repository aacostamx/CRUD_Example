USE Ejemplo
GO

IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE NAME = 'EMPLEADO')
BEGIN
	DROP TABLE dbo.Empleado;
END

CREATE TABLE dbo.Empleado
(
IDEmpleado INT IDENTITY(1,1) PRIMARY KEY,
Nombre	   VARCHAR(100)  NOT NULL,
Departamento VARCHAR(50) NOT NULL,
);

INSERT INTO dbo.Empleado
VALUES('Antonio Acosta','Sistemas')

SELECT * FROM  dbo.Empleado