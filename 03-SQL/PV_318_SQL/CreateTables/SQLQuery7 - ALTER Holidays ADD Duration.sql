USE PD_318_DML;
GO

--ALTER TABLE Holidays
--ADD duration	TINYINT
--;

UPDATE	Holidays
SET		duration=14
WHERE	holiday_name LIKE N'%��������%';
GO

UPDATE	Holidays
SET		holiday_name=N'������ ��������'
WHERE	holiday_name LIKE N'��������'

SELECT * FROM Holidays;