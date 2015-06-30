USE Ejemplo
GO

IF NOT EXISTS (SELECT NAME FROM sys.objects WHERE name = 'Empleado')
BEGIN
   CREATE TABLE dbo.Empleado(
		ID INT IDENTITY(1,1) PRIMARY KEY,
		Nombre			CHAR(90) NOT NULL,
		Departamento	CHAR(40) NOT NULL
		)
END

IF OBJECT_ID('[dbo].[spInsertaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spInsertaEmpleado]
GO

CREATE PROCEDURE [dbo].[spInsertaEmpleado](@Nombre CHAR(90) = '', @Departamento CHAR(40) = '')
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON

	INSERT INTO dbo.Empleado
	VALUES (@Nombre,@Departamento)
	IF @@ERROR<>0
	BEGIN
		SET @msgError = 'Erro al insertar en la tabla Empleado';
		GOTO Error;
	END


SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO

IF OBJECT_ID('[dbo].[spConsultaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spConsultaEmpleado]
GO

CREATE PROCEDURE [dbo].[spConsultaEmpleado](@Empleado INT = 0)
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON

	IF(@Empleado = 0)
	BEGIN
		SELECT ID,Nombre,Departamento FROM dbo.Empleado
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al consutar en la tabla Empleado';
			GOTO Error;
		END
	END
	ELSE
	BEGIN
		SELECT ID,Nombre,Departamento FROM dbo.Empleado WHERE ID = @Empleado
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al consutar en la tabla Empleado';
			GOTO Error;
		END
	END
SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO


IF OBJECT_ID('[dbo].[spActualizaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spActualizaEmpleado]
GO

CREATE PROCEDURE [dbo].[spActualizaEmpleado](@Empleado INT, @Nombre CHAR(90) = '', @Departamento CHAR(40) = '')
AS

DECLARE @msgError VARCHAR(100);
SET NOCOUNT ON

	IF(@Nombre<>'' AND @Departamento<>'')
	BEGIN
		UPDATE Empleado
		SET Nombre = @Nombre, Departamento=@Departamento
		WHERE ID=@Empleado
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al actualizar al empleado en la tabla Empleado';
			GOTO Error;
		END
	END
	ELSE
	BEGIN
	IF(@Nombre<>'')
	BEGIN
		UPDATE Empleado
		SET Nombre = @Nombre
		WHERE ID=@Empleado
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al actualizar al empleado en la tabla Empleado';
			GOTO Error;
		END
	END
	IF(@Departamento<>'')
	BEGIN
		UPDATE Empleado
		SET Departamento=@Departamento
		WHERE ID=@Empleado
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al actualizar al empleado en la tabla Empleado';
			GOTO Error;
		END
	END
END

SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO

IF OBJECT_ID('[dbo].[spEliminaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spEliminaEmpleado]
GO

CREATE PROCEDURE [dbo].[spEliminaEmpleado](@Empleado INT)
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON

	DELETE FROM dbo.Empleado WHERE ID=@Empleado
	IF @@ERROR<>0
	BEGIN
		SET @msgError = 'Erro al eliminar en la tabla Empleado';
		GOTO Error;
	END

SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO

--spInsertaEmpleado 1,'Antonio Acosta','Finanzas'
--GO
--spInsertaEmpleado 2,'Jorge Romero','Contabilidad'
--GO
--spInsertaEmpleado 3,'Pedro Murilo','Recursos Humanos'
--GO
--spInsertaEmpleado 3,'Pedro Murilo','Recursos Humanos'
--GO

--spConsultaEmpleado 
--GO
--spConsultaEmpleado 1
--GO
--spActualizaEmpleado 1,'','Sistemas'
--GO
--spEliminaEmpleado 3
