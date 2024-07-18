CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `mostprofitableyearandbestgenre` AS
    SELECT 
        `pd`.`Publisher` AS `Publisher`,
        `vg`.`Year` AS `Year`,
        `vg`.`Genre` AS `Genre`,
        SUM(`vs`.`Global_Sales`) AS `Yearly_Profits`
    FROM
        ((`vgsales` `vs`
        JOIN `vgnames` `vg` ON ((`vs`.`ID_games` = `vg`.`ID_games`)))
        JOIN `publisher_details` `pd` ON ((`vg`.`ID_publisher` = `pd`.`ID_publisher`)))
    GROUP BY `pd`.`Publisher` , `vg`.`Year` , `vg`.`Genre`
    HAVING (SUM(`vs`.`Global_Sales`) = (SELECT 
            MAX(`yearly_sales`.`Yearly_Profits`)
        FROM
            (SELECT 
                `pd_inner`.`Publisher` AS `Publisher`,
                    `vg_inner`.`Year` AS `Year`,
                    SUM(`vs_inner`.`Global_Sales`) AS `Yearly_Profits`
            FROM
                ((`vgsales` `vs_inner`
            JOIN `vgnames` `vg_inner` ON ((`vs_inner`.`ID_games` = `vg_inner`.`ID_games`)))
            JOIN `publisher_details` `pd_inner` ON ((`vg_inner`.`ID_publisher` = `pd_inner`.`ID_publisher`)))
            GROUP BY `pd_inner`.`Publisher` , `vg_inner`.`Year`) `yearly_sales`
        WHERE
            (`yearly_sales`.`Publisher` = `pd`.`Publisher`)))