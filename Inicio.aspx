<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="CRUD_Example.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>CRUD</title>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="http://aacosta.com.mx/">Aacosta.com.mx</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Inicio.aspx">Alta de empleado <span class="sr-only">(current)</span></a></li>
                        <li><a href="ConsultaEmpleado.aspx">Consultar empleado</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <h1>Alta de empleados</h1>

        <div>
            <div class="form-group">
                <label for="lbNombre">Nombre</label>
                <input type="text" class="form-control" id="inputNombre" placeholder="Ingresar nombre" />
            </div>
        </div>

        <div class="form-group">
            <label for="lbDepto">Departamento</label>
            <input type="text" class="form-control" id="inputDepto" placeholder="Ingresar departamento" />
        </div>
        <div class="form-group">
            <div>
                <button type="submit" class="btn btn-danger"  onclick="LimpiaInputs()">Cancelar</button>
                <button type="submit" class="btn btn-primary" onclick="InsertarEmpleado()">Ingresar</button>
            </div>
        </div>
    </div>
    <script src="Scripts/Crud_Example.js"></script>
    <script src="Scripts/jquery-2.1.4.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/json2.js"></script>
</body>
</html>
