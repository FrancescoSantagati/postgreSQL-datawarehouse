/*
Elencare i progetti europei che hanno speso più di 3000 euro 
in missioni per studenti di dottorato nell’ultimo anno
*/

SELECT progetto."nome", SUM(missione."costo")
FROM "ProgettoDT" as progetto,
     "MissioneFT" as missione, 
     "MembroDT" as membro, 
     "DataDT" as data
WHERE progetto."progettoId" = missione."progettoId"
        AND data."dataId" = missione."dataInizioId"
        AND missione."membroId" = membro."membroId"
        AND membro."tipoMembro" = 'Dottorando'
        AND progetto."tipoProgetto" = 'Europeo'
        AND to_timestamp(data."giorno" || '-' || data."mese" || '-' || data."anno", 'DD-MM-YYYY') 
             > CURRENT_DATE - INTERVAL '1 years'
GROUP BY progetto."progettoId"
HAVING SUM(missione."costo") > 3000