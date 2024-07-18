CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `top10mostsuccessfulcompanies` AS
    SELECT 
        `pd`.`Publisher` AS `Publisher`,
        SUM(`vs`.`Global_Sales`) AS `Total_Profits`
    FROM
        ((`vgsales` `vs`
        JOIN `vgnames` `vg` ON ((`vs`.`ID_games` = `vg`.`ID_games`)))
        JOIN `publisher_details` `pd` ON ((`vg`.`ID_publisher` = `pd`.`ID_publisher`)))
    GROUP BY `pd`.`Publisher`
    ORDER BY `Total_Profits` DESC
    LIMIT 10