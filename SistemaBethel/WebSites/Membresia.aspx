<%@ Page Title="Membresía" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Membresia.aspx.vb" Inherits="SistemaBethel.Membresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title%>.</h2>
    <div class="form-group">
        <table class="table table-bordered">
            <tr>
                <td style="text-align: center">
                    <table class="table">
                        <tr>
                            <td>Primer Nombre:<asp:Label ID="lb_id_miembro" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_pnombre" CssClass="form-control" runat="server"></asp:TextBox></td>

                            <td>Segundo Nombre:</td>
                            <td>
                                <asp:TextBox ID="tb_snombre" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Primer Apellido:</td>
                            <td>
                                <asp:TextBox ID="tb_papellido" CssClass="form-control" runat="server"></asp:TextBox></td>

                            <td>Segundo Apellido:</td>
                            <td>
                                <asp:TextBox ID="tb_sapellido" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>Lider Inmediato</td>
                            <td colspan="3">
                                <asp:DropDownList ID="cb_lider" CssClass="form-control" runat="server" Width="100%" DataTextField="NombreCompleto" DataValueField="Id">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Número Celular</td>
                            <td>
                                <asp:TextBox ID="tb_celular" CssClass="form-control" runat="server"></asp:TextBox></td>

                            <td>Compañía de Celular</td>
                            <td>
                                <asp:DropDownList ID="cb_company" CssClass="form-control" runat="server" Width="100%">
                                    <asp:ListItem Value="-">Ninguna</asp:ListItem>
                                    <asp:ListItem Value="C">Claro</asp:ListItem>
                                    <asp:ListItem Value="M">Movistar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center">
                                <asp:Button ID="btn_insert" CssClass="btn-sm" runat="server" Text="Insertar" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <asp:GridView ID="gv_miembros" OnSelectedIndexChanged="gv_miembros_SelectedIndexChanged"  CssClass="table table-condensed table-bordered table-hover" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="Id" AllowPaging="True" AutoGenerateSelectButton="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Código" />
            <asp:BoundField DataField="NombreCompleto" HeaderText="Nombres y Apellidos" />
            <asp:BoundField DataField="NumCelular" HeaderText="Celular" />
            <asp:BoundField DataField="Company" HeaderText="Companía"></asp:BoundField>
            <asp:BoundField DataField="LiderInmediato" HeaderText="Lider Inmediato" />
            <asp:BoundField DataField="Red" HeaderText="Red" />
            <asp:BoundField DataField="Pastor" HeaderText="Pastor" />
            <asp:BoundField DataField="PNombre" HeaderText="PNombre" />
            <asp:BoundField DataField="SNombre" HeaderText="SNombre" />
            <asp:BoundField DataField="PApellido" HeaderText="PApellido" />
            <asp:BoundField DataField="SApellido" HeaderText="SApellido" />
        </Columns>
    </asp:GridView>
</asp:Content>
