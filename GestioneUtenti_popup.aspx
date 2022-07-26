<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GestioneUtenti_popup.aspx.cs" Inherits="GestioneUtenti_popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>

                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAbilitazione" runat="server" Text="Abilitato:"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnAbilitato" runat="server" Text="Si" GroupName="abilitazione" />
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnNonAbilitato" runat="server" Text="No" GroupName="abilitazione" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTipoUtente" runat="server" Text="Tipo di utente:"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnAdmin" runat="server" Text="Admin" GroupName="tipoUtente" />
                        <asp:Label ID="lblSuperAdmin" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnUser" runat="server" Text="User" GroupName="tipoUtente" />
                    </td>
                </tr>

            </table>

            <br />

            <asp:Button ID="btnModifica" runat="server" Text="Modifica" OnClick="btnModifica_Click" />
        </div>
    </form>
</body>
</html>
