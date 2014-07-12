#!/usr/bin/env escript

%% Requires the libraries ibrowse, jiffy and ej to be installed locally.

process_jogos([Jogo | Jogos]) ->
    Status = ej:get({"status"}, Jogo),
    if 
        <<"completed">> =:= Status ->
            io:format("~s ~B vs ~s ~B~n", 
                      [ej:get({"home_team", "country"}, Jogo), 
                       ej:get({"home_team", "goals"}, Jogo),
                       ej:get({"away_team", "country"}, Jogo), 
                       ej:get({"away_team", "goals"}, Jogo)]);
        true -> []
    end,
    process_jogos(Jogos);
process_jogos([]) -> [].

main(_) ->
    {ok, _} = ibrowse:start(),
    {ok, "200", _, Body} =
        ibrowse:send_req("http://worldcup.sfg.io/matches", [], get),
    process_jogos(jiffy:decode(Body)).
