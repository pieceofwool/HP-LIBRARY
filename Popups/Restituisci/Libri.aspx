<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Libri.aspx.cs" Inherits="Popups_Restituisci_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:Label ID="lbl" runat="server"></asp:Label>
            <table runat="server" id="tabella">
                <tr>
                    <td>Restituire il libro selezionato?</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAnnulla" runat="server" Text="Restituisci" OnClick="btnAnnulla_Click" />
                    </td>
                </tr>
            </table>
        </div>
        </div>
    </form>
</body>
</html>
