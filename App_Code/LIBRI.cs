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

    public LIBRI(int codLibro, int codUtente)
    {
        this.codLibro = codLibro;
        this.codUtente = codUtente;
    }

    public LIBRI(string titolo, string autore, byte[] copertina, string genere, string sinossi)
    {
        this.titolo = titolo;
        this.autore = autore;
        this.copertina = copertina;
        this.genere = genere;
        this.sinossi = sinossi;
    }

    public LIBRI(int codLibro, string titolo, string autore, byte[] copertina, string genere, string sinossi)
    {
        this.codLibro = codLibro;
        this.titolo = titolo;
        this.autore = autore;
        this.copertina = copertina;
        this.genere = genere;
        this.sinossi = sinossi;
    }

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

    /// <summary>
    /// Inserisce un libro
    /// </summary>
    public void Insert()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_INSERT");
        cmd.Parameters.AddWithValue("@titolo", titolo);
        cmd.Parameters.AddWithValue("@autore", autore);
        cmd.Parameters.AddWithValue("@copertina", copertina);
        cmd.Parameters.AddWithValue("@genere", genere);
        cmd.Parameters.AddWithValue("@sinossi", sinossi);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Aggiorna un libro
    /// </summary>
    public void Update()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_UPDATE");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);
        cmd.Parameters.AddWithValue("@titolo", titolo);
        cmd.Parameters.AddWithValue("@autore", autore);
        cmd.Parameters.AddWithValue("@copertina", copertina);
        cmd.Parameters.AddWithValue("@genere", genere);
        cmd.Parameters.AddWithValue("@sinossi", sinossi);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Elimina un libro
    /// </summary>
    public void Delete()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_DELETE");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }
    /// <summary>
    /// Annulla prenotazione
    /// </summary>
    public void AnnullaPrenotazione()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_ANNULLAPRENOTAZIONE");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    #endregion

    #region UTILITY

    /// <summary>
    /// Noleggia un libro all'utente specificato
    /// </summary>
    public void Noleggia()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_NOLEGGIA");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Restituisce un libro
    /// </summary>
    public void Restituisci()
    {
        SqlCommand cmd = new SqlCommand("LIBRI_RESTITUISCI");
        cmd.Parameters.AddWithValue("@codLibro", codLibro);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Determina se il libro è stato nolegiatto da più di 90 gg
    /// </summary>
    /// <returns></returns>
    public bool InRitardo()
    {
        DateTime dataPrestito = Select(codLibro).Rows[0].Field<DateTime>("dataPrestito");
        return (DateTime.Now - dataPrestito).Days > 90;
    }

    #endregion
}