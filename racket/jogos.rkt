#lang racket
(require net/http-client json)

(map (lambda (y)
       (list (hash-ref (hash-ref y 'home_team) 'country)
             (hash-ref (hash-ref y 'home_team) 'goals)
             (hash-ref (hash-ref y 'away_team) 'country)
             (hash-ref (hash-ref y 'away_team) 'goals)
             ))
     (let-values ([(stat head response) (http-sendrecv "worldcup.sfg.io" "/matches")])
       (filter (lambda (x) (equal? "completed" (hash-ref x 'status)))
               (read-json response))))
