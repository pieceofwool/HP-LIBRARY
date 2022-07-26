using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Nel page load carico la griglia con TUTTI gli utenti, sia quelli abilitati che non
        UTENTI u = new UTENTI();
        griglia.DataSource = u.Select();
        griglia.DataBind();

        Session["codUtente"] = "0";
    }

    protected void btnAggiorna_Click(object sender, EventArgs e)
    {
        // A SECONDA DEI FILTRI SELEZIONATI CARICO NELLA GRIGLIA:

        // 1. Gli utenti abilitati
        if (checkAbilitati.Checked == true)
        {
            UTENTI u = new UTENTI();
            griglia.DataSource = u.Select(true);
            griglia.DataBind();
        }

        // 2. Gli utenti NON abilitati
        if (checkNonAbilitati.Checked == true)
        {
            UTENTI u = new UTENTI();
            griglia.DataSource = u.Select(false);
            griglia.DataBind();
        }
        
        // 3. Gli utenti abilitati e non abilitati
        if (checkAbilitati.Checked == true & checkNonAbilitati.Checked == true)
        {
            UTENTI u = new UTENTI();
            griglia.DataSource = u.Select();
            griglia.DataBind();
        }
    }

    protected void griglia_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = griglia.SelectedRow;
        Session["codUtente"] = griglia.SelectedDataKey[0].ToString();

        btnModifica.Enabled = true;
    }
}