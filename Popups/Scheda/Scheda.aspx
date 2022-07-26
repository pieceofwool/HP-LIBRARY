<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scheda.aspx.cs" Inherits="Popups_Scheda_Scheda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <img id="imgCopertina" runat="server"  width="300"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTitolo" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAutore" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblGenere" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSinossi" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDataPrestito" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnNoleggia" runat="server" Text="Noleggia" OnClick="btnNoleggia_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessaggio" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>