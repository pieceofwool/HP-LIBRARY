using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registrazione_conferma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnInvia_Click(object sender, EventArgs e)
    {
        // controlli formali
        if (string.IsNullOrEmpty(txtRndCodice.Text) || string.IsNullOrEmpty(txtPassword.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Attenzione: compilare tutti i campi!')", true);
            return;
        }

        string email = Request.QueryString["email"].ToString();

        UTENTI u = new UTENTI();
        u.email = email;
        u.password = CRYPTA.Crypta(txtRndCodice.Text);

        // se il codice corrisponde salvo nel DB la nuova pass e reindirizzo al login
        if (u.Login(false) == true)
        {
            string nuovaPassword = CRYPTA.Crypta(txtPassword.Text.Trim());
            u.password = nuovaPassword;

            u.Update(nuovaPassword);
            Response.Redirect("login.aspx");
        }

        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Codice temporaneo errato!')", true);
            return;
        }
    }
}