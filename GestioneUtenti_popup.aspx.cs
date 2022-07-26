using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestioneUtenti_popup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UTENTI u = new UTENTI();

        if (!IsPostBack)
        {
            int codUtente = int.Parse(Session["codUtente"].ToString()); 
            DataTable dt = new DataTable();
            dt = u.Select(codUtente);

            txtEmail.Text = dt.Rows[0]["email"].ToString();
            bool abilitato = Convert.ToBoolean(dt.Rows[0]["abilitato"].ToString());
            string tipoUtente = dt.Rows[0]["tipoUtente"].ToString();

            // vado a checkare automaticamente il radiobutton in base all'abilitazione dell'utente che sto cercando di modificare
            if (abilitato == true)
            {
                rbtnAbilitato.Checked = true;
            }

            else
            {
                rbtnNonAbilitato.Checked = true;
            }

            // vado a checkare automaticamente il radiobutton in base ai permessi dell'utente che sto cercando di modificare
            if (tipoUtente == "A")
            {
                rbtnAdmin.Checked = true;
            }

            if (tipoUtente == "U")
            {
                rbtnUser.Checked = true;
            }
        }
    }
    protected void btnModifica_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtEmail.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Attenzione: Inserire indirizzo email')", true);
            return;
        }

        UTENTI u = new UTENTI();
        u.email = txtEmail.Text.Trim();

        if (rbtnAbilitato.Checked == true)
        {
            u.abilitato = true;
        }

        if (rbtnNonAbilitato.Checked == true)
        {
            u.abilitato = false;
        }

        if (rbtnAdmin.Checked == true)
        {
            u.tipoUtente = "A";
        }
        
        if (rbtnUser.Checked == true)
        {
            u.tipoUtente = "U";
        }

        int codUtente = int.Parse(Session["codUtente"].ToString());
        u.codUtente = codUtente;

        u.Update();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Dati modificati correttamente.')", true);
        return;
    }
}