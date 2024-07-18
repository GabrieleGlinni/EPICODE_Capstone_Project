CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `videogame_companies`.`genreprofits` AS
    SELECT 
        `vg`.`Genre` AS `Genre`,
        SUM(`vs`.`Global_Sales`) AS `Total_Profits`
    FROM
        (`videogame_companies`.`vgsales` `vs`
        JOIN `videogame_companies`.`vgnames` `vg` ON ((`vs`.`ID_games` = `vg`.`ID_games`)))
    GROUP BY `vg`.`Genre`