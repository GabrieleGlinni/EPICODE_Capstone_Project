CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `americancompanies` AS
    SELECT 
        `pd`.`ID_publisher` AS `ID_publisher`,
        `pd`.`Publisher` AS `Publisher`,
        `pd`.`Headquarters` AS `Headquarters`
    FROM
        `publisher_details` `pd`
    WHERE
        ((`pd`.`Headquarters` LIKE '%USA%')
            OR (`pd`.`Headquarters` LIKE '%United States%')
            OR (`pd`.`Headquarters` LIKE '%America%'))