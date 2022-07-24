using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //menu dinamico che aggiunge il pulsante "gestione utenti" se l'utente è A o S
        string u = Session["tipoUtente"].ToString();
        string t = "";
        if (u == "S" || u == "A")
        {
            t += "<a class='pulsantino' href='GestioneUtenti.aspx'>GESTIONE UTENTI</a>";
        }
        ltlUtenti.Text = t;

        ////controllo che non ci siano libri prenotati da più di 90 gg
        //LIBRI L = new LIBRI();
        //string CodiceUtente = Session["CodiceUtente"].ToString();
        //int CodUtente = int.Parse(CodiceUtente);
        //DataTable dt = new DataTable();
        //dt = L.SelectByUtente(CodUtente);

        //DateTime date = DateTime.Now;
        //int i = 0;
        //for (i = 0; i < dt.Rows.Count; i++)
        //{
        //    SqlDateTime prestito = new SqlDateTime();
        //    prestito = (SqlDateTime)dt.Rows[i]["dataPrestito"];
        //    TimeSpan diff = date.Subtract((DateTime)prestito);
        //    string mesidiff = (diff.ToString()).Substring(3, 2);

        //    if (int.Parse(mesidiff) > 2)
        //    {
        //        litAvvertimento.Text = "<div id='avvertimento'><span>ATTENZIONE! Uno dei tuoi libri è in prestito da più di 90 giorni. Ti preghiamo di restituirlo al più presto!</span></div>";
        //    }
        //}

    }
}
