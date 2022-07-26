using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Popups_Restituisci_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Controllo che il record sia selezionato
            if (Session["codLibro"] == null)
            {
                NascondiTabella();
                return;
            }
        }
    }
    protected void btnAnnulla_Click(object sender, EventArgs e)
    {
        // Controllo che il record sia ancora selezionato
        if (Session["codLibro"] == null)
        {
            NascondiTabella();
            return;
        }

        // Elimino il record
        new LIBRI(int.Parse(Session["codLibro"].ToString())).Restituisci();

        // Operazioni di pulizia
        Session["codLibro"] = null;
        tabella.Visible = false;
        lbl.Text = "Prenotazione Annullata!";

    }


    void NascondiTabella()
    {
        tabella.Visible = false;
        lbl.Text = "Selezionare un libro dalla tabella";
    }
}