using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdLibri.DataSource = new LIBRI().Select();
            grdLibri.DataBind();
        }
    }

    protected void grdLibri_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["codLibro"] = grdLibri.SelectedDataKey[0].ToString();

        btnModifica.Enabled = true;
        btnElimina.Enabled = true;
    }
}