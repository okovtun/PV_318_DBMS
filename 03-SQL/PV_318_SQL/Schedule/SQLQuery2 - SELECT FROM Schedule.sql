USE PD_318_DML;
GO

SELECT
		[����]			= [date],
		[�����]			= [time],
		[������]		= group_name,
		[����������]	= discipline_name,
		[�������������]	= FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
		[���� �������]	= [subject],
		[������]		= IIF(spent, N'���������', N'�������������')
FROM	Schedule, Groups, Disciplines, Teachers
;