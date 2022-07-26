<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrazione.aspx.cs" Inherits="registrazione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/stile.css" rel="stylesheet" />
</head>
<body id="sfondologin">
    <form id="form1" runat="server">
        <div id="login">
            <p id="titolologin">Registrazione</p>

            <table id="tabellalogin">
                <tr>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Inserisci la tua email" TextMode="Email" CssClass="boxTesto"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btnInvia" CssClass="pulsantilogin" runat="server" Text="Invia" OnClick="btnInvia_Click" />

        </div>
    </form>
</body>
</html>
