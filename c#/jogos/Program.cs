using System;
class Program{
    static void Main(string[] args){
        foreach (var e in System.Web.Helpers.Json.Decode((string)(new System.Net.WebClient()).DownloadString("http://worldcup.sfg.io/matches")))
            Console.Write((e.status == "completed") ? " {0} {1} vs {2} {3}\n":"", e.home_team.country, e.home_team.goals, e.away_team.country, e.away_team.goals); } }