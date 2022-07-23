using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registrazione : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInvia_Click(object sender, EventArgs e)
    {
        // controlli formali
        if (string.IsNullOrEmpty(txtEmail.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "ATTENZIONE", "alert('Dati non validi')", true);
            return;
        }

        // mi salvo la textbox come variabili
        string mail = txtEmail.Text.Trim();

        UTENTI u = new UTENTI();
        u.email = mail;

        // controllo se l'utente non sia già registrato
        if (u.Registrato() == true)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "ATTENZIONE", "alert('Utente già registrato')", true);
            return;
        }

        // mando la mail di conferma all'indirizzo dell'utente con il codice di conferma generato casualmente
        Random rnd = new Random();
        string rndCodice = rnd.Next(100000, 999999).ToString();

        MAIL m = new MAIL();
        m.mailUtente = mail;
        m.rndCodice = rndCodice;

        m.mailInvia();

        // inserisco nella tab utenti l'email e rndCodice
        u.email = mail;
        u.password = rndCodice.ToString();
        u.Insert();

        // reindirizzo l'utente alla pagina di conferma passandogli il codice generato randomicamente e l'email
        Response.Redirect("registrazione_conferma.aspx?email=" + mail +"&rndCodice=" + CRYPTA.Crypta(rndCodice));
    }
}