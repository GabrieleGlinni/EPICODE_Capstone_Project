CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `videogame_companies`.`mostsoldgamesinjapan2010` AS
    SELECT 
        `vg`.`Name` AS `Name`, `vs`.`JP_Sales` AS `Japan_Sales`
    FROM
        (`videogame_companies`.`vgsales` `vs`
        JOIN `videogame_companies`.`vgnames` `vg` ON ((`vs`.`ID_games` = `vg`.`ID_games`)))
    WHERE
        (`vg`.`Year` = 2010)
    ORDER BY `vs`.`JP_Sales` DESC
    LIMIT 15