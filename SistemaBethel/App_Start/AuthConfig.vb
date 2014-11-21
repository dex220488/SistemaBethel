Imports Microsoft.AspNet.Membership.OpenAuth
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web

Friend NotInheritable Class AuthConfig
    Private Sub New()
    End Sub
    Public Shared Sub RegisterOpenAuth()
        ' See http://go.microsoft.com/fwlink/?LinkId=252803 for details on setting up this ASP.NET
        ' application to support logging in via external services.

        'LOS PARÁMETROS SE OBTIENEN DE LA PÁGINA DEVELOPER DE LAS CUENTAS 
        'OpenAuth.AuthenticationClients.AddTwitter("xvz1evFS4wEEPTGEFPHBog", "L8qq9PZyRg6ieKGEKhZolGC0vJWLw8iEJ88DRdyOg")
        '    consumerKey: "your Twitter consumer key",
        '    consumerSecret: "your Twitter consumer secret");

        'OpenAuth.AuthenticationClients.AddFacebook("", "")
        '    appId: "your Facebook app id",
        '    appSecret: "your Facebook app secret");

        OpenAuth.AuthenticationClients.AddMicrosoft("000000004C12E697", "xxYGSWlq5lY2651gAB2jbg7iKceIFRcW")
        '    clientId: "your Microsoft account client id",
        '    clientSecret: "your Microsoft account client secret");

        OpenAuth.AuthenticationClients.AddGoogle()
    End Sub
End Class
