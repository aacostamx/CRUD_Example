function InsertarEmpleado()
{
    var nombre;
    var departamento;

    nombre = document.getElementById("inputNombre").value;
    departamento = document.getElementById("inputDepto").value;

    if(nombre && departamento)
    {
        var jdata = "{Nombre: '" + nombre + "', Depto: '" + departamento + "'}";
        
        $.ajax({
            type: "POST",
            cache: false,
            contentType: "application/json; charset=utf-8",
            url: "Inicio.aspx/InsertaEmpleado",
            data: "{Nombre: '" + nombre + "', Depto: '" + departamento + "'}",
            dataType: "json",
            async: false,
            success: function (data) {
                var server_response = data.d;
                if (server_response) {
                    alert("El empleado " + nombre + " ha sido dado de alta en el departamento de " + departamento);
                }
                else {
                    alert("No fue posible dar de alta al empleado " + nombre + " del departamento " + departamento);
                }
            },
            error: function (result) {
                alert("ERROR " + result.status + ' ' + result.statusText);
            }
        });
    }
    else
    {
        alert("Favor de ingresar todos los campos");
    }

    document.getElementById("inputNombre").value = "";
    document.getElementById("inputDepto").value = "";
}

function LimpiaInputs() {
    document.getElementById("inputNombre").value = "";
    document.getElementById("inputDepto").value = "";
}