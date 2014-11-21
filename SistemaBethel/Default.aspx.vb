Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Microsoft.AspNet.Membership.OpenAuth

Public Class _Default
    Inherits System.Web.UI.Page

    Public Property ReturnUrl() As String
        Get
            Return m_ReturnUrl
        End Get
        Set(value As String)
            m_ReturnUrl = value
        End Set
    End Property

    Private m_ReturnUrl As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            'Make a request to the OAuth provider
            Dim provider = Request.Form("provider")
            If provider Is Nothing Then
                Return
            End If

            Dim redirectUrl = "~/ExternalLoginLandingPage.aspx"
            If Not [String].IsNullOrEmpty(ReturnUrl) Then
                Dim resolvedReturnUrl = ResolveUrl(ReturnUrl)
                redirectUrl += "?ReturnUrl=" & HttpUtility.UrlEncode(resolvedReturnUrl)
            End If

            OpenAuth.RequestAuthentication(provider, redirectUrl)
        End If
    End Sub

    Public Function GetProviderNames() As IEnumerable(Of ProviderDetails)
        Return OpenAuth.AuthenticationClients.GetAll()
    End Function

End Class