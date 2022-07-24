<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Libri.aspx.cs" Inherits="Popups_Inserisci_Libri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl" runat="server"></asp:Label>
            <table>
                <tr>
                    <td>
                        <asp:FileUpload ID="fupCopertina" runat="server" ToolTip="Copertina" accept=".png,.jpg,.jpeg" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtTitolo" runat="server" MaxLength="50" Placeholder="Titolo"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtAutore" runat="server" MaxLength="50" Placeholder="Autore"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtGenere" runat="server" MaxLength="50" Placeholder="Genere"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtSinossi" runat="server" Placeholder="Sinossi" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnInserisci" runat="server" Text="Inserisci" OnClick="btnInserisci_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
