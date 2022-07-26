<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LibriNoleggiati.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Libri Noleggiati</title>

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
    <div class="div">
        <h4 class="titolo">LIBRI NOLEGGIATI</h4>

        <asp:Button ID="btnAggiorna" class="button-8" runat="server" Text="Aggiorna Griglia" OnClick="btnAggiorna_Click" />

        <asp:Button runat="server" Text="Restituisci Libro" class="button-8" ID="btnRestituisci" ClientIDMode="Static" Enabled="False" />


        <br />
        <br />

        <asp:GridView runat="server" class="griglia" ID="grdLibriPrestito" AutoGenerateColumns="False" DataKeyNames="codLibro" OnSelectedIndexChanged="grdLibriPrestito_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="codLibro" HeaderText="codLibro" Visible="False" />
                <asp:BoundField DataField="titolo" HeaderText="Titolo" />
                <asp:BoundField DataField="autore" HeaderText="Autore" />
                <asp:BoundField DataField="dataprestito" HeaderText="Data Prestito" />
                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="button-griglia" ShowSelectButton="True" />
            </Columns>
            <HeaderStyle />
            <HeaderStyle CssClass="headergrid" />
        </asp:GridView>
    </div>
</asp:Content>

