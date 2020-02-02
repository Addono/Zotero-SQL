SELECT * 
FROM fields 
	INNER JOIN itemData ON itemData.fieldID = fields.fieldID 
	INNER JOIN itemDataValues ON itemDataValues.valueID = itemData.valueID 
WHERE fields.fieldName = "language"
	AND itemDataValues.value = "EN"