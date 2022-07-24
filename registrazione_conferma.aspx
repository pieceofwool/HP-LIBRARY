<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrazione_conferma.aspx.cs" Inherits="registrazione_conferma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>CONFERMA REGISTRAZIONE</h1>

        <table>
            <tr>
                <td>
                    <h4>Codice provissorio: </h4>
                </td>
                <td>
                    <asp:TextBox ID="txtRndCodice" runat="server" placeholder="Inserisci il codice provvisorio"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>Nuova password: </h4>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Inserisci la tua password" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnInvia" runat="server" Text="Invia" OnClick="btnInvia_Click" />

    </form>
</body>
</html>
