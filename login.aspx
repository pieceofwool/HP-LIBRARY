<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
            <p id="titolologin">Login</p>

            <table id="tabellalogin">
                <tr>
                    
                    <td>
                        <asp:TextBox CssClass="boxTesto" ID="txtMail" PlaceHolder="Indirizzo Email" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    
                    <td>
                        <asp:TextBox CssClass="boxTesto" ID="txtPassword" PlaceHolder="Password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btnInvia" CssClass="pulsantilogin" runat="server" Text="Invia" OnClick="btnInvia_Click" />

            <br />

            <p id="preg">Non sei ancora registrato? <a href="registrazione.aspx">Registrati!</a></p>
        </div>
    </form>
</body>
</html>
