/*
Stabilire il costo medio e massimo delle missioni
svoltesi in Italia negli ultimi 6 mesi da personale strutturato *
*/

SELECT AVG(Cast(missione.costo as Float)) as costoMedio,
       MAX(Cast(missione.costo as Float)) as costoMassimo
FROM "MissioneFT" as missione,
     "LuogoDT" as luogo,
     "MembroDT" as membro,
     "DataDT" as data
WHERE luogo."luogoId" = missione."luogoId"
        AND data."dataId" = missione."dataInizioId"
        AND missione."membroId" = membro."membroId"
        AND luogo."stato" = 'Italia'
        AND (membro."tipoMembro" = 'Docente' OR membro."tipoMembro" = 'Tecnico-Amministrativo')
        AND to_timestamp(data."giorno" || '-' || data."mese" || '-' || data."anno", 'DD-MM-YYYY') > CURRENT_DATE - INTERVAL '6 months'
