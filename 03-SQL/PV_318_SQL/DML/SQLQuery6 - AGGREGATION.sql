USE PV_318_SQL;

SELECT 
	--COUNT(direction_name) 
	FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL middle_name) AS N'�.�.�.',
	group_name		AS N'������',
	direction_name		AS N'����������� ��������',
	--COUNT(group_id)		AS N'���������� �����',
	--COUNT(student_id)	AS N'���������� ���������'
FROM		Groups,Directions,Students
WHERE		direction=direction_id
AND			[group]=group_id
GROUP BY	direction_name
;
--COUNT, MIN, MAX, SUM, AVG