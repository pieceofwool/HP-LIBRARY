<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GestioneUtenti.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--JQUERY PER IL POPUP--%>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/base/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>

    <script type="text/javascript">

        // nel momento in cui la pagina è pronta devi tenere pronte anche le seguenti funzioni
        $(document).ready(function () {

            $('#popup').click(function () {

                var url = 'GestioneUtenti_popup.aspx';
                var dialog = $('<iframe src="' + url + '"frameborder="0"</iframe>').appendTo('body');

                dialog.dialog({

                    modal: true,
                    title: 'Modifica dati',
                    resizable: false,
                    width: '400px',
                    overlay: { opacity: 0.9, background: 'black' },
                    open: function (type, data) { $(this).parent().appendTo('form'); }

                });
                return false;
            });

        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <h1>GESTIONE UTENTI</h1>

    <asp:Label ID="lblFiltri" runat="server" Text="Filtri:  "></asp:Label>
    <asp:CheckBox ID="checkAbilitati" runat="server" Text="Utenti Abilitati" Checked="True" />
    <asp:CheckBox ID="checkNonAbilitati" runat="server" Text="Utenti Non abilitati" Checked="True" />

    <br />
    <br />

    <asp:Button ID="btnAggiorna" runat="server" Text="Aggiorna Griglia" OnClick="btnAggiorna_Click" />

    <br />
    <br />

    <a href="GestioneUtenti_popup.aspx" id="popup">Modifica i dati selezionati</a>

    <br />
    <br />

    <asp:GridView ID="griglia" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="griglia_SelectedIndexChanged" DataKeyNames="codUtente" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="codUtente" Visible="false" />
            <asp:BoundField DataField="tipoUtente" HeaderText="Tipo di utente" />
            <asp:CheckBoxField DataField="abilitato" HeaderText="Abilitato" ReadOnly="True" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="password" Visible="false" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Seleziona" ShowHeader="True" Text="Seleziona" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

</asp:Content>

