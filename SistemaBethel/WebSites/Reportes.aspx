<%@ Page Title="Reportes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reportes.aspx.vb" Inherits="SistemaBethel.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title%>.</h2>
    <div class="form-group">
        <table class="table table-bordered">
            <tr>
                <td>
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Button ID="btn_cel" CssClass="btn btn-default" runat="server" Text="Nueva Célula" />
                                <asp:Button ID="btn_rpt" CssClass="btn btn-default" runat="server" Text="Nuevo Reporte" />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:MultiView ID="mv" runat="server">
                                    <asp:View ID="vw_rpt" runat="server">
                                        <table class="table">
                                            <tr>
                                                <td style="width: 10%">Fecha:</td>
                                                <td style="width: 20%">
                                                    <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox></td>
                                                <td style="width: 10%">Anfitrión:</td>
                                                <td>
                                                    <asp:DropDownList ID="cb_anfitrion_rpt" CssClass="form-control" runat="server" Width="100%" DataTextField="NombreCompleto" DataValueField="Id">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="border: 1px solid;">
                                            <table class="table table-condensed">
                                                <tr>
                                                    <td colspan="4" style="background-color: gray; font: bold">Información de Personas</td>
                                                </tr>
                                                <tr>
                                                    <td>Hermanos:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                    <td>Invitados:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Niños:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                    <td>Ofrenda:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <hr />
                                        <div style="border: 1px solid;">
                                            <table class="table table-condensed">
                                                <tr>
                                                    <td colspan="4" style="background-color: gray; font: bold">Información de Actividad</td>
                                                </tr>
                                                <tr>
                                                    <td>Conversiones:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                    <td>Reconcilios:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Bautismo en Agua:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                    <td>Bautismo en E.S.:</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table class="table">
                                            <tr>
                                                <td colspan="4" style="text-align: center">
                                                    <asp:Button ID="Button3" CssClass="btn-sm" runat="server" Text="Insertar" /></td>
                                            </tr>
                                        </table>

                                    </asp:View>
                                    <asp:View ID="vw_cel" runat="server">
                                        <table class="table" style="width: 100%">
                                            <tr>
                                                <td style="width: 10%">Líder:</td>
                                                <td>
                                                    <asp:DropDownList ID="cb_lider" CssClass="form-control" runat="server" Width="100%" DataTextField="NombreCompleto" DataValueField="Id">
                                                    </asp:DropDownList>
                                                </td>

                                                <td style="width: 10%">Anfitrión:</td>
                                                <td style="width: 130px" colspan="3">
                                                    <asp:DropDownList ID="cb_anfitrion" CssClass="form-control" runat="server" Width="100%" DataTextField="NombreCompleto" DataValueField="Id">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Día:</td>
                                                <td>
                                                    <asp:DropDownList ID="cb_dia" CssClass="form-control" runat="server" Width="100%">
                                                        <asp:ListItem>Lunes</asp:ListItem>
                                                        <asp:ListItem>Martes</asp:ListItem>
                                                        <asp:ListItem>Miércoles</asp:ListItem>
                                                        <asp:ListItem>Jueves</asp:ListItem>
                                                        <asp:ListItem>Viernes</asp:ListItem>
                                                        <asp:ListItem>Sábado</asp:ListItem>
                                                        <asp:ListItem>Domingo</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>A las:</td>
                                                <td>
                                                    <asp:TextBox ID="tb_hora" CssClass="form-control" type="time" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center">
                                                    <asp:Button ID="btn_insert" CssClass="btn btn-sm" runat="server" Text="Insertar" /></td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <asp:GridView ID="gv_miembros" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Código" />
            <asp:BoundField DataField="NombreCompleto" HeaderText="Nombres y Apellidos" />
            <asp:BoundField DataField="NumCelular" HeaderText="Celular" />
            <asp:BoundField DataField="Company" HeaderText="Companía"></asp:BoundField>
            <asp:BoundField DataField="LiderInmediato" HeaderText="Lider Inmediato" />
            <asp:BoundField DataField="Red" HeaderText="Red" />
            <asp:BoundField DataField="Pastor" HeaderText="Pastor" />
        </Columns>
    </asp:GridView>
</asp:Content>
