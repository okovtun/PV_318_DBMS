USE PD_318_DML;
GO

UPDATE	DaysOFF
SET		holiday=(SELECT holiday_id FROM Holidays WHERE holiday_name LIKE N'%Новогодние%')
--WHERE	[date] > N'2023-12-01' AND [date] < N'2024-01-31'
WHERE	[date]	BETWEEN '2023-12-01' AND '2024-01-31'
;

SELECT 
		[Дата]		= [date],
		[Праздник]	= holiday_name
FROM DaysOFF JOIN	Holidays ON (holiday=holiday_id)