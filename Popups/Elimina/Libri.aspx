<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Libri.aspx.cs" Inherits="Popups_Elimina_Libri" %>

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
            <table runat="server" id="tabella">
                <tr>
                    <td>Eliminare il libro selezionato?</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnElimina" runat="server" Text="Elimina" OnClick="btnElimina_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
