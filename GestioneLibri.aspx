<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GestioneLibri.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Gestione Libri</title>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnInserisci').click(function () {
                var url = '/Popups/Inserisci/Libri.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                dialog.dialog({
                    modal: true,
                    title: 'Inserimento dati',
                    resizable: false,
                    width: 250,
                    height: 280,
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

            $('#btnModifica').click(function () {
                var url = '/Popups/Modifica/Libri.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                dialog.dialog({
                    modal: true,
                    title: 'Modifica dati',
                    resizable: false,
                    width: 250,
                    height: 280,
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

            $('#btnModifica').click(function () {
                var url = '/Popups/Elimina/Libri.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                dialog.dialog({
                    modal: true,
                    title: 'Elimina dati',
                    resizable: false,
                    width: 250,
                    height: 280,
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button runat="server" Text="Inserisci Libro" ID="btnInserisci" ClientIDMode="Static" />
    <asp:Button runat="server" Text="Modifica Libro" ID="btnModifica" ClientIDMode="Static" Enabled="False" />
    <asp:Button runat="server" Text="Elimina Libro" ID="btnElimina" ClientIDMode="Static" Enabled="False" />

    <asp:GridView runat="server" ID="grdLibri" AutoGenerateColumns="False" DataKeyNames="codLibro" OnSelectedIndexChanged="grdLibri_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="codLibro" HeaderText="codLibro" Visible="False" />
            <asp:BoundField DataField="titolo" HeaderText="Titolo" />
            <asp:BoundField DataField="autore" HeaderText="Autore" />
            <asp:BoundField DataField="genere" HeaderText="Genere" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

