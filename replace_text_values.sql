UPDATE itemDataValues 
SET value = REPLACE(value, "replace this", "with this")
WHERE valueID in (
	SELECT valueID
	FROM itemData
		INNER JOIN fieldsCombined ON itemData.fieldID = fieldsCombined.fieldID
	WHERE 
		fieldName in ("title")
)

