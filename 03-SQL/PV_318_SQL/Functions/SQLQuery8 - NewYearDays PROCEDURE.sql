USE PD_318_DML;
GO

ALTER PROCEDURE sp_NewYearDaysFor
	@year	AS	INT
AS
BEGIN
	DECLARE @start_date		AS	DATE	= dbo.GetLastMonOfYear(@year-1);
	DECLARE @date			AS	DATE	= dbo.GetLastMonOfYear(@year-1);
	DECLARE @holiday		AS	SMALLINT = (SELECT holiday_id FROM Holidays WHERE holiday_name = N'���������� ��������');
	DECLARE @duration		AS	TINYINT	= (SELECT duration FROM Holidays WHERE holiday_id=@holiday);

	WHILE(DATEDIFF(DAY, @start_date, @date) <= @duration)
	BEGIN
		IF NOT EXISTS (SELECT day_off_id FROM DaysOFF WHERE [date]=@date)
		BEGIN
			INSERT DaysOFF	([date], holiday)
			VALUES			(@date, @holiday);
		END
		SET @date = DATEADD(DAY, 1, @date);
	END
END
GO