<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LibriNoleggiati.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Gestione Libri</title>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnRestituisci').click(function () {
                var url = '/Popups/Restituisci/Libri.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                dialog.dialog({
                    modal: true,
                    title: 'Restituzione libro',
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button runat="server" Text="Restituisci Libro" ID="btnRestituisci" ClientIDMode="Static" />

    <asp:Button ID="btnAggiorna" runat="server" Text="Aggiorna Griglia" OnClick="btnAggiorna_Click" />

    <asp:GridView runat="server" ID="grdLibriPrestito" AutoGenerateColumns="False" DataKeyNames="codLibro" OnSelectedIndexChanged="grdLibriPrestito_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="codLibro" HeaderText="codLibro" Visible="False" />
            <asp:BoundField DataField="titolo" HeaderText="Titolo" />
            <asp:BoundField DataField="autore" HeaderText="Autore" />
            <asp:BoundField DataField="dataprestito" HeaderText="Data Prestito" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

