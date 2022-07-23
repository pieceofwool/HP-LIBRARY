using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Gestisce le interazioni con la tabella degli utenti
/// </summary>
public class UTENTI
{
    public int codUtente;
    public string tipoUtente;
    public bool abilitato;
    public string email;
    public string password;

    #region COSTRUTTORI

    public UTENTI() { }

    public UTENTI(int codUtente) { this.codUtente = codUtente; }

    public UTENTI(string email, string password)
    {
        this.email = email;
        this.password = password;
    }

    public UTENTI (int codUtente, string tipoUtente, bool abilitato, string email)
    {
        this.codUtente = codUtente;
        this.tipoUtente = tipoUtente;
        this.abilitato = abilitato;
        this.email = email;
    }

    #endregion

    #region CONTROLLI

    /// <summary>
    /// Controlla che un utente sia registrato
    /// </summary>
    /// <returns>true se esiste un utente con la mail usata, false se non esiste</returns>
    public bool Registrato()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_REGISTRATO");
        cmd.Parameters.AddWithValue("@email", email);

        CONNESSIONE conn = new CONNESSIONE();
        DataTable dt = conn.EseguiSelect(cmd);

        return dt.Rows.Count > 0;
    }

    /// <summary>
    /// Controlla l'esistenza nel DB di un utente con email e password specificati
    /// </summary>
    /// <param name="controlloAbilitazione">Se true, controlla anche che l'utente sia abilitato</param>
    /// <returns></returns>
    public bool Login(bool controlloAbilitazione = true)
    {
        SqlCommand cmd = new SqlCommand("UTENTI_LOGIN");
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@password", password);

        CONNESSIONE conn = new CONNESSIONE();
        DataTable dt = conn.EseguiSelect(cmd);

        if (dt.Rows.Count == 0) return false;

        if (controlloAbilitazione) return dt.Rows[0].Field<bool>("abilitato");

        return true;
    }

    #endregion

    #region OPERAZIONI

    /// <summary>
    /// Inserisce un utente alla sua prima registrazione
    /// </summary>
    public void Insert()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_INSERT");
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@password", password);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Aggiorna il record di un Utente ad eccezione della password
    /// </summary>
    public void Update()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_UPDATE");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);
        cmd.Parameters.AddWithValue("@tipoUtente", tipoUtente);
        cmd.Parameters.AddWithValue("@abilitato", abilitato);
        cmd.Parameters.AddWithValue("@email", email);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    /// <summary>
    /// Aggiorna la password di un utente alla conferma registrazione
    /// </summary>
    public void Update(string password)
    {
        SqlCommand cmd = new SqlCommand("UTENTI_UPDATEPWD");
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@password", password);

        CONNESSIONE conn = new CONNESSIONE();
        conn.EseguiCmd(cmd);
    }

    #endregion

    #region SELETTORI

    /// <summary>
    /// Seleziona tutti gli utenti
    /// </summary>
    /// <returns>Una tabella contenente i dati di tutti gli utenti</returns>
    public DataTable Select()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_SELECTALL");
        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    /// <summary>
    /// Seleziona un utente col codice fornito
    /// </summary>
    /// <param name="codUtente">L'ID dell'utente da selezionare</param>
    /// <returns>I dati dell'utente selezionato</returns>
    public DataTable Select(int codUtente)
    {
        SqlCommand cmd = new SqlCommand("UTENTI_SELECTONE");
        cmd.Parameters.AddWithValue("@codUtente", codUtente);

        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    /// <summary>
    /// Seleziona tutti gli utenti abilitati o non abilitati
    /// </summary>
    /// <param name="abilitato">Se true, seleziona tutti gli utenti abilitati, se false tutti quelli non abilitati</param>
    /// <returns>Una tabella contenente i dati degli utenti selezionati</returns>
    public DataTable Select(bool abilitato)
    {
        SqlCommand cmd = new SqlCommand("UTENTI_SELECTABILITATI");
        cmd.Parameters.AddWithValue("@abilitato", abilitato);

        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd);
    }

    #endregion

    #region UTILITY

    /// <summary>
    /// Recupera il codice utente di un utente
    /// </summary>
    /// <returns></returns>
    public int RecuperaCodUtente()
    {
        SqlCommand cmd = new SqlCommand("UTENTI_GETCODUTENTE");
        cmd.Parameters.AddWithValue("@email", email);

        CONNESSIONE C = new CONNESSIONE();

        return C.EseguiSelect(cmd).Rows[0].Field<int>("codUtente");
    }

    /// <summary>
    /// Recupera il tipo utente di un eutente
    /// </summary>
    /// <param name="codUtente">L'ID dell'utente</param>
    /// <returns></returns>
    public string RecuperaTipoUtente(int codUtente) { return Select(codUtente).Rows[0].Field<string>("tipoUtente"); }

    #endregion
}