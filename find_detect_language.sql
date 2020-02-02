SELECT *
FROM itemData
		INNER JOIN fields ON fields.fieldID = itemData.fieldID
		INNER JOIN itemDataValues ON itemDataValues.valueID = itemData.valueID
WHERE fields.fieldName = "title"
		AND itemDataValues.value LIKE '% the %'
		AND NOT EXISTS (SELECT * FROM itemData as itemData2 INNER JOIN fields ON fields.fieldID = itemData2.fieldID WHERE fields.fieldName = "language" and itemData.itemID = itemData2.itemID)