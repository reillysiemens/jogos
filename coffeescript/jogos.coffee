http = require 'http'
http.get 'http://worldcup.sfg.io/matches', (res) ->
  buffer = ''
  res.on 'data', (chunk) ->
    buffer += chunk
  res.on 'end', () ->
    results = JSON.parse buffer
    for jogo in results
      if jogo.status is 'completed'
        console.log "#{jogo.home_team.country} #{jogo.home_team.goals} vs #{jogo.away_team.country} #{jogo.away_team.goals}"
