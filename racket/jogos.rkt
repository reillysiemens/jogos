#lang racket
(require net/http-client json)

;query page
;parse json
;filter that the status is completed
;for each match grab the country and goals entries from the team
; separate home and away with a 'vs'
; format entries as strings
; separate them with spaces
;separate matches with newlines
;display the results
(display (string-join (map (lambda (match)
       (string-join (map ~a (list (hash-ref (hash-ref match 'home_team) 'country)
             (hash-ref (hash-ref match 'home_team) 'goals)
             "vs"
             (hash-ref (hash-ref match 'away_team) 'country)
             (hash-ref (hash-ref match 'away_team) 'goals)
             )) " "))
     (let-values ([(stat head response) (http-sendrecv "worldcup.sfg.io" "/matches")])
       (filter (lambda (match) (equal? "completed" (hash-ref match 'status)))
               (read-json response)))) "\n"))
