using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// gestisce le interazioni con la tabella LIBRI
/// </summary>
public class LIBRI
{
    int codLibro;
    int codUtente;
    string titolo;
    string autore;
    byte[] copertina;
    string genere;
    string sinossi;
    string dataPrestito;

    #region COSTRUTTORI

    public LIBRI() { }

    public LIBRI(int codLibro) { this.codLibro = codLibro; }

    #endregion

    #region SELETTORI

    /// <summary>
    /// Seleziona tutti i libri
    /// </summary>
    /// <returns>Una tabella contenente i dati di tutti i libri</returns>
    public DataTable Select()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_SELECTALL");
        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    /// <summary>
    /// Seleziona un libro
    /// </summary>
    /// <param name="codLibro">L'ID del libro selezionato</param>
    /// <returns>Una tabella contenente i dati del libro selezionato</returns>
    public DataTable Select(int codLibro)
    {
        SqlCommand cmd = new SqlCommand("LIBRI_SELECTONE");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);

        CONNESSIONE C = new CONNESSIONE();
        return C.EseguiSelect(cmd);
    }

    /// <summary>
    /// Seleziona i libri noleggiati da un utente
    /// </summary>
    /// <returns></returns>
    public DataTable SelectByUtente(int codUtente)
    {
        SqlCommand cmd = new SqlCommand("LIBRI_SELECTBYUTENTE");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE C = new CONNESSIONE();
        return C.EseguiSelect(cmd);
    }

    /// <summary>
    /// Seleziona solo i libri non noleggiati
    /// </summary>
    /// <returns>Una tabella contenente i dati del libri selezionati</returns>
    public DataTable SelectDisponibili()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_SELECTDISPONIBILI");
        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    #endregion

    #region OPERATORI



    #endregion
}