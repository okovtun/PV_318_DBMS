USE PD_318_DML;
GO

SELECT
		[Дата]			= [date],
		[Время]			= [time],
		[Группа]		= group_name,
		[Дисциплина]	= discipline_name,
		[Преподаватель]	= FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
		[Тема занятия]	= [subject],
		[Статус]		= IIF(spent, N'Проведено', N'Запланировано')
FROM	Schedule, Groups, Disciplines, Teachers
;