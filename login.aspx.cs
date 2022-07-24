using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnInvia_Click(object sender, EventArgs e)
    {
        // controlli formali
        if (string.IsNullOrEmpty(txtMail.Text) || string.IsNullOrEmpty(txtPassword.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Attenzione: compilare tutti i campi!')", true);
            return;
        }

        // occhio alla pass, è criptata!! se volete fare delle prove inserendo qualcosa a mano dal DB
        // togliete il CRYPTA a riga 29
        UTENTI u = new UTENTI();
        u.email = txtMail.Text.Trim();
        u.password = CRYPTA.Crypta(txtPassword.Text.Trim());

        // se il login va a buon fine, reindirizzo alla pagina figlia "default.aspx
        // e mi salvo il tipoUtente nella session

        if (u.Login() == true)
        {
            int codiceUtente = u.RecuperaCodUtente();
            Session["tipoUtente"] = u.RecuperaTipoUtente(codiceUtente);
            Response.Redirect("GestioneLibri.aspx");
            Session["CodiceUtente"] = codiceUtente;
        }

        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Password o email errati o autorizzazione all'accesso negata')", true);
            return;
        }
    }
}