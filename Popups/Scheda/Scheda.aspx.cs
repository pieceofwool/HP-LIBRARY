using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Popups_Scheda_Scheda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Controllo che il record sia selezionato
            if (Session["idCodLibro"] == null)
            {
                return;
            }

            // Recupero i dati del libro selezionato e li inserisco nei campi del form
            DataRow libro = new LIBRI().Select(int.Parse(Session["idCodLibro"].ToString())).Rows[0];

            lblTitolo.Text = libro["titolo"].ToString();
            lblAutore.Text = libro["autore"].ToString();
            lblGenere.Text = libro["genere"].ToString();
            lblSinossi.Text = libro["sinossi"].ToString();
            lblDataPrestito.Text = libro["dataPrestito"].ToString();
            byte[] arr = libro.Field<byte[]>("copertina");
            string base64String = Convert.ToBase64String(arr, 0, arr.Length);
            imgCopertina.Src = "data:image/jpg;base64," + base64String;


            LIBRI l = new LIBRI();
            if (l.Disponibile(int.Parse(Session["idCodLibro"].ToString())))
            {
                btnNoleggia.Enabled = true;
            }
            else
            {
                btnNoleggia.Enabled = false;
            }
        }
    }

    protected void btnNoleggia_Click(object sender, EventArgs e)
    {
        int codLibro = int.Parse(Session["idCodLibro"].ToString());
        int codiceUtente = int.Parse(Session["CodiceUtente"].ToString());

        LIBRI l = new LIBRI(codLibro, codiceUtente);
        l.Noleggia();
        lblMessaggio.Text = "Libro noleggiato";
        btnNoleggia.Enabled = false;
    }
    public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
    {
        MemoryStream ms = new MemoryStream(byteArrayIn);
        System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
        return returnImage;
    }
}