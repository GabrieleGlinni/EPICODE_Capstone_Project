CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `americancompanyprofits` AS
    SELECT 
        `ac`.`Publisher` AS `Publisher`,
        `ac`.`Headquarters` AS `Headquarters`,
        SUM(`vs`.`Global_Sales`) AS `Total_Profits`
    FROM
        ((`vgsales` `vs`
        JOIN `vgnames` `vg` ON ((`vs`.`ID_games` = `vg`.`ID_games`)))
        JOIN `americancompanies` `ac` ON ((`vg`.`ID_publisher` = `ac`.`ID_publisher`)))
    GROUP BY `ac`.`Publisher` , `ac`.`Headquarters`