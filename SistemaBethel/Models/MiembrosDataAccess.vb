Namespace Data

    Public Class MiembrosDataAccess
        Inherits DBAccess

        Public Function GetMiembros() As List(Of v_miembros)
            Return dtx.v_miembros.ToList()
        End Function

        Public Function GetLastId() As Long
            Try
                Return dtx.miembros.OrderByDescending(Function(a) a.Id).Max(Function(a) a.Id)
            Catch ex As Exception
                Return 0
            End Try
        End Function

        Public Function Insert(campos As miembros) As Boolean
            Try
                dtx.miembros.Add(campos)
                dtx.SaveChanges()
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function


    End Class

End Namespace