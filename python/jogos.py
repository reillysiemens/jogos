from json import loads
from urllib.request import urlopen
print("\n".join([" vs ".join(map(lambda x: x['country']+" "+str(x['goals']),(i['home_team'], i['away_team']))) 
    for i in loads(urlopen('http://worldcup.sfg.io/matches').read().decode('utf-8')) if i['status']=='completed']))
