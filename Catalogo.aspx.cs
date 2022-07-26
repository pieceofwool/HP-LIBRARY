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
        CaricaGriglia();
    }

    #region Metodi
    protected void CaricaGriglia()
    {
        LIBRI l = new LIBRI();
        grdCatalogo.DataSource = l.Select();
        grdCatalogo.DataBind();
    }
    protected void CaricaGenere()
    {
        LIBRI l = new LIBRI();
        string genere = txtRicGenere.Text;
        grdCatalogo.DataSource = l.SelectGenere(genere);
        grdCatalogo.DataBind();
    }

    #endregion Metodi

    #region Eventi
    protected void griglia_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["idCodLibro"] = grdCatalogo.SelectedDataKey[0].ToString();
        Session["idCodUtente"] = grdCatalogo.SelectedDataKey[1].ToString();
        btnScheda.Enabled = true;
    }

    protected void btnRicerca_Click(object sender, EventArgs e)
    {
        CaricaGenere();
    }
    protected void btnAggiorna_Click(object sender, EventArgs e)
    {
        CaricaGriglia();
        txtRicGenere.Text = "";
    }

    #endregion Eventi

}