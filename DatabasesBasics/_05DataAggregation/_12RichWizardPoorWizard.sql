SELECT SUM(`wd`.`deposit_amount` - (SELECT `deposit_amount`
                                    FROM `wizzard_deposits` AS `wd1`
                                    WHERE `wd1`.`id` = `wd`.`id` + 1)) AS `sum_difference`
FROM `wizzard_deposits` AS `wd`;