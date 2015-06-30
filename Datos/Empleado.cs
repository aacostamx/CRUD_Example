
namespace Datos
{
    public class Empleado
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Departamento { get; set; }

        public Empleado()
        {
            Id = 0;
            Nombre = string.Empty;
            Departamento = string.Empty;
        }

        public Empleado(string nombre, string depto)
        {
            this.Nombre = nombre;
            this.Departamento = depto;
        }
    }
}
