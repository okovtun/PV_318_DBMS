USE PV_318_SQL;

INSERT Students
		(last_name,		first_name, middle_name,	birth_date,	[group])
VALUES
		(N'���������',  N'�����',	N'����������', '2002-09-15', 	5),
		(N'���������',  N'�������',	N'����������', '1978-12-30', 	4),
		(N'�������',  N'������',	N'�������������', '2000-01-06', 5),
		(N'������',  N'�������',	N'�������������', '1986-02-06', 4),
		(N'������',  N'������',	N'���������', '1995-01-05', 		3),
		(N'���������',  N'�����',	N'������������', '2005-07-08',	3),
		(N'������',  N'�����',	N'������������', '2004-08-07',		4);

SELECT * FROM Students;