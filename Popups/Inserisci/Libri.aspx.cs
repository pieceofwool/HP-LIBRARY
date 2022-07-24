using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Popups_Inserisci_Libri : System.Web.UI.Page
{
    string[] estensioni = { ".jpg", ".png", ".bmp"};

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInserisci_Click(object sender, EventArgs e)
    {
        // Controlli formali
        if (
            string.IsNullOrWhiteSpace(txtTitolo.Text) ||
            string.IsNullOrWhiteSpace(txtAutore.Text) ||
            string.IsNullOrWhiteSpace(txtGenere.Text) ||
            string.IsNullOrWhiteSpace(txtSinossi.Text)
            )
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Dati non Validi')", true); ;
            return;
        }

        if (!fupCopertina.HasFile)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Nessun file caricato')", true); ;
            return;
        }

        if (!estensioni.Contains(Path.GetExtension(fupCopertina.FileName)))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Formato file non valido: caricare .jpg, .png o .bmp')", true); ;
            return;
        }

        // Creazione variabili
        string titolo = txtTitolo.Text.Trim();
        string autore = txtAutore.Text.Trim();
        string genere = txtGenere.Text.Trim();
        string sinossi = txtSinossi.Text.Trim();
        byte[] copertina = fupCopertina.FileBytes;

        LIBRI l = new LIBRI(titolo, autore, copertina, genere, sinossi);

        // Inserimento e operazioni di pulizia
        l.Insert();

        lbl.Text = "Inserimento effettuato!";
        txtTitolo.Text = string.Empty;
        txtAutore.Text = string.Empty;
        txtGenere.Text = string.Empty;
        txtSinossi.Text = string.Empty;
        fupCopertina.Dispose();
    }
}