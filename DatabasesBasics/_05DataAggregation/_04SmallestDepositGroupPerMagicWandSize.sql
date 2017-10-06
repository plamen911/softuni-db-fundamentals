SELECT deposit_group
FROM wizzard_deposits
ORDER BY AVG(magic_wand_size)
LIMIT 1;