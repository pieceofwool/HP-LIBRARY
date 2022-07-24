<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrazione.aspx.cs" Inherits="registrazione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>REGISTRAZIONE</h1>

        <table>
            <tr>
                <td>
                    <h4>Inserisci la tua email: </h4>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Inserisci la tua email" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
        </table>

            <asp:Button ID="btnInvia" runat="server" Text="Invia" OnClick="btnInvia_Click" />

        </div>
    </form>
</body>
</html>
