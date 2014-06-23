import java.net.*;
import java.io.*;
import org.json.*;
public class Jogos{
    public static void main (String[] args) throws Exception {
        URL worldCup = new URL("http://worldcup.sfg.io/matches");
        URLConnection conn = worldCup.openConnection();
        BufferedReader in = new BufferedReader(
                                new InputStreamReader(
                                conn.getInputStream())); 
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            sb.append(line);
        }
        JSONArray jogos = new JSONArray(sb.toString());
        for (int i = 0; i < jogos.length(); i++) {
            JSONObject jogo = jogos.getJSONObject(i);
            if (jogo.getString("status").equals("completed")) {
                JSONObject home_team = jogo.getJSONObject("home_team");
                JSONObject away_team = jogo.getJSONObject("away_team");
                System.out.format("%s %d vs %s %d\n", home_team.getString("country"), home_team.getInt("goals"), away_team.getString("country"), away_team.getInt("goals"));
            }
        }
    }
}
