using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Gestisce la connessione col database SQL e le sue operazioni principali
/// </summary>
public class CONNESSIONE
{
    // Dichiarazione membri
    SqlConnection conn;

    // Costruttore
    public CONNESSIONE() { conn = new SqlConnection(K.connectionString); }

    /// <summary>
    /// Esegue una stored procedure di selezione con parametri
    /// </summary>
    /// <param name="cmd">L'oggetto SqlCommand con i parametri già caricati</param>
    /// <returns>Una tabella contenente i dati selezionati</returns>
    public DataTable EseguiSelect(SqlCommand cmd)
    {
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;

        DA.Fill(dt);
        return dt;
    }

    /// <summary>
    /// Esegue una stored procedure con parametri
    /// </summary>
    /// <param name="cmd">L'oggetto SqlCommand con i parametri già caricati</param>
    public void EseguiCmd(SqlCommand cmd)
    {
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}