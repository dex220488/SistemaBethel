<%@ Page Title="" Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ExternalLoginLandingPage.aspx.vb" Inherits="SistemaBethel.ExternalLoginLandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hgroup class="title">
        <h1>Regístrese con su cuenta <%: ProviderDisplayName %> </h1>
        <h2><%: ProviderUserName %></h2>
    </hgroup>
    <asp:ModelErrorMessage ID="ModelErrorMessage1" runat="server" ModelStateKey="Provider" CssClass="field-validation-error" />
    <asp:PlaceHolder runat="server" ID="userNameForm">
        <fieldset>
            <legend>Formulario de Asociación</legend>
            <p>
                Ud. se ha autenticado con  <strong><%: ProviderDisplayName %></strong> como
                <strong><%: ProviderUserName %></strong>. Por favor ingrese su nombre de usuario para registrarse en el sitio y de clic en Ingresar
            </p>
            <ol>
                <li class="email">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="userName">Nombre de Usuario</asp:Label>
                    <asp:TextBox runat="server" ID="userName" />
                    <asp:ModelErrorMessage ID="ModelErrorMessage2" runat="server" ModelStateKey="UserName" CssClass="field-validation-error" />
                </li>
            </ol>
            <asp:Button ID="Button1" runat="server" Text="Ingresar" ValidationGroup="NewUser" OnClick="logIn_Click" />
            <asp:Button ID="Button2" runat="server" Text="Cancelar" CausesValidation="false" OnClick="cancel_Click" />
        </fieldset>
    </asp:PlaceHolder>
</asp:Content>
