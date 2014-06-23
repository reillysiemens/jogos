require 'net/http'
require 'json'
res = Net::HTTP.get_response(URI('http://worldcup.sfg.io/matches'))
results = JSON.parse(res.body)
for jogo in results
    if jogo['status'] == 'completed'
        puts "#{jogo['home_team']['country']} #{jogo['home_team']['goals']} vs #{jogo['away_team']['country']} #{jogo['away_team']['goals']}"
    end
end
