using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Popups_Modifica_Libri : System.Web.UI.Page
{
    string[] estensioni = { ".jpg", ".png", ".bmp" };

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

            // Recupero i dati del libro selezionato e li inserisco nei campi del form
            DataRow libro = new LIBRI().Select(int.Parse(Session["codLibro"].ToString())).Rows[0];

            txtTitolo.Text = libro["titolo"].ToString();
            txtAutore.Text = libro["autore"].ToString();
            txtGenere.Text = libro["genere"].ToString();
            txtSinossi.Text = libro["sinossi"].ToString();
        }
    }

    protected void btnModifica_Click(object sender, EventArgs e)
    {
        // Controllo che il record sia ancora selezionato
        if (Session["codLibro"] == null)
        {
            NascondiTabella();
            return;
        }

        int codLibro = int.Parse(Session["codLibro"].ToString());
        byte[] copertina = new LIBRI().Select(codLibro).Rows[0].Field<byte[]>("copertina");
        
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

        // Se viene immessa una nuova copertina uso quella, altrimenti tengo la vecchia
        if (fupCopertina.HasFile)
        {
            if (!estensioni.Contains(Path.GetExtension(fupCopertina.FileName)))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ATTENZIONE", "alert('Formato file non valido: caricare .jpg, .png o .bmp')", true); ;
                return;
            }

            copertina = fupCopertina.FileBytes;
        }

        // Creazione variabili
        string titolo = txtTitolo.Text.Trim();
        string autore = txtAutore.Text.Trim();
        string genere = txtGenere.Text.Trim();
        string sinossi = txtSinossi.Text.Trim();

        LIBRI l = new LIBRI(codLibro, titolo, autore, copertina, genere, sinossi);

        // Aggiornamento e operazioni di pulizia
        l.Update();

        lbl.Text = "Modifica effettuata!";
        tabella.Visible = false;
        fupCopertina.Dispose();
        Session["codLibro"] = null;
    }

    void NascondiTabella()
    {
        tabella.Visible = false;
        lbl.Text = "Selezionare un libro dalla tabella";
    }
}