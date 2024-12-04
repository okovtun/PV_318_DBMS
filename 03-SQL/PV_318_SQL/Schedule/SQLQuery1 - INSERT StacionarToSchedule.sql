USE PD_318_DML;
GO

SET DATEFIRST 1;

--DECLARE @name		AS	TYPE	 = value;
DECLARE	@start_date AS	DATE	 = '2024-10-25';
DECLARE @time		AS	TIME	 = '18:30';
DECLARE @group		AS	INT		 = (SELECT group_id FROM Groups WHERE group_name='PV_318');
DECLARE @discipline AS	SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE ('%MS SQL Server'));
DECLARE @teacher	AS	INT		 = (SELECT teacher_id FROM Teachers WHERE first_name=N'����');

PRINT(@group)
PRINT(@discipline)
PRINT(@teacher)

DECLARE @date		AS	DATE	 = @start_date
DECLARE @number_of_lessons	AS	SMALLINT = 
		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline)
PRINT(@number_of_lessons)

DECLARE @number_of_lesson AS SMALLINT = 1;

PRINT('======================');
WHILE (@number_of_lesson <= @number_of_lessons)
BEGIN
	--TODO: 
	PRINT(@date);
	PRINT(DATENAME(WEEKDAY, @date));
	PRINT(DATEPART(DW, @date));

	PRINT(@number_of_lesson);
	PRINT(@time);
	IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group]=@group AND discipline=@discipline)
	BEGIN
		INSERT	Schedule
				([date], [time], [group], discipline, teacher, spent)
		VALUES	(@date,  @time,	 @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0))
	END
	SET @number_of_lesson = @number_of_lesson + 1;
	PRINT('----------------------');

	PRINT(@number_of_lesson);
	PRINT(DATEADD(MINUTE, 90,@time));
	IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=DATEADD(MINUTE, 90, @time) AND [group]=@group AND discipline=@discipline)
	BEGIN
		INSERT	Schedule
				([date], [time], [group], discipline, teacher, spent)
		VALUES	(@date,  DATEADD(MINUTE, 90, @time),	 @group, @discipline, @teacher, IIF(@date < GETDATE(), 1, 0))
	END

	SET @number_of_lesson = @number_of_lesson + 1;
	PRINT('======================');

	SET @date = DATEADD(DAY, IIF(DATEPART(DW,@date)=1 OR DATEPART(DW,@date)=3,2,3), @date);

	--IF(DATEPART(DW, @date) = 1 OR DATEPART(DW, @date) = 3)
	--BEGIN
	--		SET @date = DATEADD(DAY, 2, @date);
	--END
	--ELSE
	--BEGIN
	--		SET @date = DATEADD(DAY, 3, @date);
	--END



--INSERT	Schedule
--		([date], [time], [group], discipline, teacher, spent)
--VALUES	(@date,  @time,	 @group, @discipline, @teacher, IIF([@date] < GETDATE(), 1, 0))
END

EXEC sp_ScheduleForGroup 'PV_318', '%MS SQL Server'

SELECT COUNT(lesson_id) FROM Schedule WHERE [group]=@group AND discipline=@discipline;