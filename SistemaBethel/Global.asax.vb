Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.SessionState

Public Class [Global]
    Inherits System.Web.HttpApplication

    Protected Sub Application_Start(sender As Object, e As EventArgs)
        AuthConfig.RegisterOpenAuth()
    End Sub
End Class