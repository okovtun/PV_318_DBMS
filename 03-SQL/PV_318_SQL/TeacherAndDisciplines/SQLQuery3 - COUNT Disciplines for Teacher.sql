USE PD_318_DML;

SELECT 
		[�.�.�.]				=	FORMATMESSAGE('%s %s %s', last_name, first_name, ISNULL(middle_name, N'')),
		[���������� ���������]	=	COUNT(discipline_name)	
FROM	Teachers,Disciplines,TeachersDisciplinesRelation
WHERE	teacher		=	teacher_id
AND		discipline	=	discipline_id
GROUP BY	last_name,first_name,middle_name
ORDER BY	[���������� ���������]
;