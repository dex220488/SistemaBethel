<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.vb" Inherits="SistemaBethel._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView runat="server" ID="providerDetails" ItemType="Microsoft.AspNet.Membership.OpenAuth.ProviderDetails"
             SelectMethod="GetProviderNames" ViewStateMode="Disabled">
             <ItemTemplate>
                 <button type="submit" name="provider" value="<%#: Item.ProviderName %>"
                     title="Ingresa usando tu cuenta de <%#: Item.ProviderDisplayName %>.">
                     <%#: Item.ProviderDisplayName %>
                 </button>
             </ItemTemplate>
             <EmptyDataTemplate>
                 <p>No se encuentra configurado ningún servidor de cuentas externo.</p>
             </EmptyDataTemplate>
         </asp:ListView>
</asp:Content>
