Public Class Reportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Using var As New Data.MiembrosDataAccess
                cb_lider.DataSource = var.GetMiembros().OrderBy(Function(a) a.NombreCompleto)
                cb_lider.DataBind()

                cb_anfitrion.DataSource = var.GetMiembros().OrderBy(Function(a) a.NombreCompleto)
                cb_anfitrion.DataBind()
            End Using
        End If
    End Sub

    Protected Sub btn_cel_Click(sender As Object, e As EventArgs) Handles btn_cel.Click
        mv.ActiveViewIndex = 1
    End Sub

    Protected Sub btn_rpt_Click(sender As Object, e As EventArgs) Handles btn_rpt.Click
        mv.ActiveViewIndex = 0
    End Sub
End Class