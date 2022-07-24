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

        // mi salvo la textbox come variabile
        string mail = txtEmail.Text.Trim();

        UTENTI u = new UTENTI();
        u.email = mail;

        // controllo se l'utente non sia già registrato
        if (u.Registrato() == true)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "ATTENZIONE", "alert('Utente già registrato')", true);
            return;
        }

        // salvo il codice di conferma generato casualmente
        Random rnd = new Random();
        string rndCodice = rnd.Next(100000, 999999).ToString();

        // inserisco nella tab utenti l'email e rndCodice
        u.email = mail;
        u.password = CRYPTA.Crypta(rndCodice.ToString());
        u.Insert();

        // mando l'email di conferma
        MAIL m = new MAIL();
        m.mailUtente = mail;
        m.rndCodice = rndCodice;

        try
        {
            m.mailInvia();
        }

        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "ATTENZIONE", "alert('Errore nell'invio dell'email. Segnati il tuo codice temporaneo: '" + rndCodice + "')", true);
            return;
        }

        ScriptManager.RegisterClientScriptBlock(this, GetType(), "ATTENZIONE", "alert('Controlla il tuo indirizzo di posta elettronica per recuperare il tuo codice provvisorio!')", true);
        return;
    }
}