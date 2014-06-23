(ns jogos.core
  (:require [clj-http.client :as http]
            [clojure.data.json :as json]))
(defn -main [& args]
  (doseq [jogo (-> (http/get "http://worldcup.sfg.io/matches")
                 (:body)
                 (json/read-str))
        :when (= (get jogo "status")
                 "completed")
        :let [{{home-country "country" home-goals "goals"} "home_team"
               {away-country "country" away-goals "goals"} "away_team"} jogo]]
    (println home-country home-goals "vs" away-country away-goals)))
