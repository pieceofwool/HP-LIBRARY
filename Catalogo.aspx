<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Catalogo.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Catalogo Libri</title>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnScheda').click(function () {
                var url = '/Popups/Scheda/Scheda.aspx';
                var dialog = $('<iframe src="' + url + '" frameborder="0"></iframe>').appendTo('body');

                dialog.dialog({
                    modal: true,
                    title: 'Inserimento dati',
                    resizable: false,
                    width: 500,
                    height: 500,
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

    <h1>CATALOGO</h1>
    <asp:TextBox ID="txtRicGenere" placeholder="Genere"  runat="server"></asp:TextBox>
    <asp:Button ID="btnRicerca" runat="server" Text="Ricerca" OnClick="btnRicerca_Click" />
    <asp:Button ID="btnScheda" runat="server" Text="Scheda" ClientIDMode="Static" Enabled="false"/>
    <asp:GridView runat="server" ID="grdCatalogo" AutoGenerateColumns="False" DataKeyNames="codLibro,codUtente" OnSelectedIndexChanged="griglia_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="codLibro" HeaderText="codLibro" Visible="False" />
            <asp:BoundField DataField="codUtente" HeaderText="codUtente" Visible="False" />
            <asp:BoundField DataField="titolo" HeaderText="Titolo" />
            <asp:BoundField DataField="autore" HeaderText="Autore" />
            <asp:BoundField DataField="genere" HeaderText="Genere" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnAggiorna" runat="server" Text="Aggiorna" OnClick="btnAggiorna_Click" />
</asp:Content>

