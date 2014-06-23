Module Module1
    Sub Main()
        For Each e In System.Web.Helpers.Json.Decode(DirectCast((New System.Net.WebClient()).DownloadString("http://sw.cs.wwu.edu/~fugiera/matches"), String)) 'worldcup.sfg.io
            Console.Write(If((e.status = "completed"), " {0} {1} vs {2} {3}" & vbLf, ""), e.home_team.country, e.home_team.goals, e.away_team.country, e.away_team.goals)
        Next
    End Sub
End Module
