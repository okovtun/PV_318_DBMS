USE PV_318_SQL;

--SELECT fields FROM tables;
--		 * - все поля

SELECT 
		last_name	AS N'Фамилия',
		first_name	AS N'Имя',
		middle_name	AS N'Отчество',
		birth_date	AS N'Дата рождения' 
FROM	Students;