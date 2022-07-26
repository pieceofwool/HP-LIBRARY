<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GestioneUtenti.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--JQUERY PER IL POPUP--%>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/base/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#btnModifica').click(function () {
                    var url = 'GestioneUtenti_popup.aspx';
                    var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                    dialog.dialog({
                        modal: true,
                        title: 'Modifica dati',
                        resizable: false,
                        width: 400,
                        height: 230,
                        overlay: {
                            opacity: 0.9,
                            background: 'black'
                        },

                        open: function (type, data) {
                            $(this).parent().appendTo('form');
                        }
                    });

                    return false;
                });

            });

        </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="div">
        <h4 class="titolo">GESTIONE UTENTI</h4>

        <asp:CheckBox ID="checkAbilitati" runat="server" Text="Utenti Abilitati" Checked="True" />
        <asp:CheckBox ID="checkNonAbilitati" runat="server" Text="Utenti Non abilitati" Checked="True" />

        <br />
        <br />

        <asp:Button ID="btnAggiorna" class="button-8" runat="server" Text="Aggiorna Griglia" OnClick="btnAggiorna_Click" />

        <asp:Button runat="server" Text="Modifica dati utente" class="button-8" ID="btnModifica" ClientIDMode="Static" Enabled="False"/>

        <br />
        <br />

        <asp:GridView ID="griglia" class="griglia" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="griglia_SelectedIndexChanged" DataKeyNames="codUtente">
            <Columns>
                <asp:BoundField DataField="codUtente" Visible="false" />
                <asp:BoundField DataField="tipoUtente" HeaderText="Tipo di utente" />
                <asp:CheckBoxField DataField="abilitato" HeaderText="Abilitato" ReadOnly="True" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="password" Visible="false" />
                <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="button-griglia" CommandName="Select" HeaderText="" ShowHeader="True" Text="Seleziona" />
            </Columns>
            <HeaderStyle />
            <HeaderStyle CssClass="headergrid" />
        </asp:GridView>
    </div>

</asp:Content>

