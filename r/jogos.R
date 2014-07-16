#!/usr/bin/env r

# Must install libcurl-dev first

#install.packages(c("RCurl", "jsonlite"), repos=c("http://cran.us.r-project.org"));
library(RCurl);
library(jsonlite);

jogos <- fromJSON(getURL("http://worldcup.sfg.io/matches"));
completed <- jogos$status == "completed"

home.teams <- jogos$home_team$country[completed]
away.teams <- jogos$away_team$country[completed]

home.scores <- jogos$home_team$goals[completed]
away.scores <- jogos$away_team$goals[completed]
    
write(paste(home.teams, home.scores, c("vs"), away.teams, away.scores), stdout())
