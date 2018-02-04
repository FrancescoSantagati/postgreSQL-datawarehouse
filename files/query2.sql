/*
Stabilire il costo medio e massimo delle missioni su progetti 
europei, fatte all’estero, nell’ultimo anno
*/

SELECT AVG(Cast(missione.costo as Float)) as costoMedio, 
       MAX(Cast(missione.costo as Float)) as costoMassimo
FROM "MissioneFT" as missione, 
     "LuogoDT" as luogo, 
     "DataDT" as data, 
     "ProgettoDT" as progetto
WHERE luogo."luogoId" = missione."luogoId"
        AND data."dataId" = missione."dataInizioId"
        AND progetto."tipoProgetto" = 'Europeo'
        AND luogo."stato" != 'Italia'
        AND to_timestamp(data."giorno" || '-' || data."mese" || '-' || data."anno", 'DD-MM-YYYY') > CURRENT_DATE - INTERVAL '1 years'