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
        if (!IsPostBack) CaricaGriglia();

    }
    protected void grdLibriPrestito_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["codLibro"] = grdLibriPrestito.SelectedDataKey[0].ToString();

        btnRestituisci.Enabled = true;
    }
    protected void btnAggiorna_Click(object sender, EventArgs e) { CaricaGriglia(); }

    void CaricaGriglia()
    {
        //    grdLibriPrestito.DataSource = new LIBRI().SelectByUtente(int.Parse(Session["CodiceUtente"].ToString()));
        //    grdLibriPrestito.DataBind();
    }
}