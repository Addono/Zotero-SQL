UPDATE itemData
SET valueID = (SELECT itemDataValues.valueID FROM itemDataValues WHERE itemDataValues.value = "EN")
WHERE EXISTS (
        SELECT *
        FROM fields
            INNER JOIN itemDataValues ON itemDataValues.valueID = itemData.valueID 
        WHERE itemData.fieldID = fields.fieldID
            AND fields.fieldName = "language"
            AND itemDataValues.value IN (
            "English",
            "en-US",
            "en"
        )
    )