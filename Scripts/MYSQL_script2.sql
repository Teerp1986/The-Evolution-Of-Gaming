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

FROM gamesales gs -- You can change this to SELECT gs.* if you want all columns from gamesales without renaming
LEFT JOIN gameconsoles gc -- You can change this to SELECT gc.* if you want all columns from gameconsoles without renaming
    ON gs.Console = gc.`Console Name`






















 

 

