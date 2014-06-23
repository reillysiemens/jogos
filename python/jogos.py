from json import loads as lds
from urllib.request import urlopen as uop
print("\n".join([" vs ".join(map(lambda x: x['country']+" "+str(x['goals']),(i['home_team'], i['away_team']))) 
    for i in lds(ruop('http://worldcup.sfg.io/matches').read().decode('utf-8')) if i['status']=='completed']))
