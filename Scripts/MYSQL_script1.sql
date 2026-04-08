CREATE TABLE dagevolve_full AS
SELECT 
    gs.`Game Title`,
    gs.Console,
    gs.Year,
    gs.Genre,
    gs.Company AS Game_Company,
    gc.Type,
    gc.Company AS Console_Company,
    gc.`Console Release Year`,
    gc.`Console Disco Year`,
    gc.`Consoles sold (million)`
FROM gamesales gs
JOIN gameconsoles gc
    ON gs.Console = gc.Console;






















 

 

