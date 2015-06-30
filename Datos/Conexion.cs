using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Conexion
    {
        string cadenaConexion = string.Empty;

        public Conexion()
        {
            cadenaConexion = "Server=MATRIX;Database=Ejemplo;User Id=sa; Password=SOPTEC;";
        }

        public void InsertaEmpleado(Empleado emp)
        {
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadenaConexion))
                {
                    using (SqlCommand comando = new SqlCommand("spInsertaEmpleado", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = emp.Nombre;
                        comando.Parameters.Add("@Departamento", SqlDbType.VarChar).Value = emp.Departamento;

                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public DataSet ConsultaEmpleados(Empleado emp)
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadenaConexion))
                {
                    using (SqlCommand comando = new SqlCommand("spInsertaEmpleado", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = emp.Nombre;
                        comando.Parameters.Add("@Departamento", SqlDbType.VarChar).Value = emp.Departamento;

                        conexion.Open();
                        comando.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return ds;
        }
    }
}
