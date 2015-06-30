using CapaNegocio;
using System;
using System.Web.Services;
using System.Web.UI;


namespace CRUD_Example
{
    public partial class Inicio : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bool InsertaEmpleado(string Nombre, string Depto)
        {
            try
            {
                new Negocio().insertaEmpleado(Nombre, Depto);
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}