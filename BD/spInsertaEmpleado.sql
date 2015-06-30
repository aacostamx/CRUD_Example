
ALTER PROCEDURE [dbo].[spInsertaEmpleado](@Nombre CHAR(90) = '', @Departamento CHAR(40) = '')
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

