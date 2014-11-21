Public Class Membresia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Using var As New Data.MiembrosDataAccess
                cb_lider.DataSource = var.GetMiembros().OrderBy(Function(a) a.NombreCompleto)
                cb_lider.DataBind()
            End Using

            CargarMiembros()
        End If
    End Sub

    Private Sub CargarMiembros()
        Using var As New Data.MiembrosDataAccess
            gv_miembros.DataSource = var.GetMiembros()
            gv_miembros.DataBind()
        End Using
    End Sub

    Protected Sub btn_insert_Click(sender As Object, e As EventArgs) Handles btn_insert.Click
        Dim entidad As New miembros
        Dim id As Long

        Using var = New Data.MiembrosDataAccess
            id = var.GetLastId()
        End Using

        entidad.Id = id + 1
        entidad.IdPadre = cb_lider.SelectedValue
        entidad.PNombre = LTrim(RTrim(tb_pnombre.Text))
        entidad.SNombre = LTrim(RTrim(tb_snombre.Text))
        entidad.PApellido = LTrim(RTrim(tb_papellido.Text))
        entidad.SApellido = LTrim(RTrim(tb_sapellido.Text))
        entidad.NumCelular = LTrim(RTrim(tb_celular.Text))
        entidad.CompaniaCelular = cb_company.SelectedValue

        Using var As New Data.MiembrosDataAccess
            If var.Insert(entidad) Then
                ScriptManager.RegisterStartupScript(Me.Page, Me.Page.GetType(), "mensaje",
                                                    "alert('Registrado Exitosamente!');", True)
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.Page.GetType(), "mensaje",
                                    "alert('Error en el registro!');", True)

            End If
        End Using

        CargarMiembros()
    End Sub

    Protected Sub gv_miembros_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_miembros.SelectedIndexChanged
        gv_miembros.Columns.Item(8).Visible = True
        gv_miembros.Columns.Item(9).Visible = True
        gv_miembros.Columns.Item(10).Visible = True
        'gv_miembros.Columns.Item(11).Visible = True

        lb_id_miembro.Text = gv_miembros.SelectedValue
        tb_pnombre.Text = gv_miembros.SelectedRow.Cells(8).Text
        tb_snombre.Text = gv_miembros.SelectedRow.Cells(9).Text
        tb_papellido.Text = gv_miembros.SelectedRow.Cells(10).Text
        tb_sapellido.Text = gv_miembros.SelectedRow.Cells(11).Text
        tb_celular.Text = gv_miembros.SelectedRow.Cells(3).Text
        cb_company.SelectedValue = gv_miembros.SelectedRow.Cells(4).Text
        'cb_lider.SelectedValue = cb_lider.DataTextField.Contains(Encoding.UTF8.SelectedRow.Cells(5).Text)
    End Sub
End Class