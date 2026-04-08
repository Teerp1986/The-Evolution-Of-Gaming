CREATE TABLE dagevolve_full AS
SELECT 
    -- Game info
    gs.Name AS Game_Name,
    gs.Console AS Console_Name,
    gs.Year AS Game_Release_Year,
    gs.Genre,
    gs.Company AS Game_Company,
    gs.`North America_Sales`,
    gs.`Europe_Sales`,
    gs.`Japan_Sales`,
    gs.`Global_Sales`,

    -- Console info
    gc.Type AS Console_Type,
    gc.Company AS Console_Company,
    gc.`Released Year` AS Console_Release_Year,
    gc.`Discontinuation Year` AS Console_Discontinuation_Year,
    gc.`Units sold (million)` AS Console_Units_Sold,
    gc.Remarks AS Console_Remarks

FROM gamesales gs
LEFT JOIN gameconsoles gc
    ON gs.Console = gc.`Console Name`






















 

 

