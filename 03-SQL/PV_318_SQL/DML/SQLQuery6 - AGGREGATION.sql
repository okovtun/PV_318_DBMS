USE PD_318_DML;

SELECT
	--COUNT(direction_name) 
	--FORMATMESSAGE(N'%s %s %s', last_name, first_name, ISNULL (middle_name,N'')) AS N'�.�.�.',
	--group_name		AS N'������',
	direction_name		AS N'����������� ��������',
	COUNT(group_id)		AS N'���������� �����'
	--COUNT(student_id)	AS N'���������� ���������'
FROM		Groups,Directions
WHERE		direction=direction_id
GROUP BY	direction_name
HAVING		COUNT(group_id) < 3
;
--COUNT, MIN, MAX, SUM, AVG