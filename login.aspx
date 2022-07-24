<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <h1>LOGIN</h1>

        <table>
            <tr>
                <td>
                    <h4>Email: </h4>
                </td>
                <td>
                    <asp:TextBox ID="txtMail" runat="server" placeholder="Inserisci la tua email" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h4>Password: </h4>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Inserisci la tua password" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnInvia" runat="server" Text="Invia" OnClick="btnInvia_Click" />

        <br />

        <h3>Non sei ancora registrato? <a href="registrazione.aspx">Registrati!</a></h3>

    </form>
</body>
</html>
