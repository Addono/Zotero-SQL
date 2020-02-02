-- Sets the language for items to english when the title contains
-- the word "the". Requires a row with value "EN" to exist in 
-- the itemDataValues table.
REPLACE INTO itemData (itemID, fieldID, valueID)
    SELECT itemData.itemID, 
        (SELECT fields.fieldID FROM fields WHERE fields.fieldName = "language"), 
        (SELECT itemDataValues.valueID FROM itemDataValues WHERE itemDataValues.value = "EN")
    FROM itemData
        INNER JOIN fields ON fields.fieldID = itemData.fieldID
        INNER JOIN itemDataValues ON itemDataValues.valueID = itemData.valueID
    WHERE fields.fieldName = "title"
        AND itemDataValues.value LIKE '% the %'
        AND NOT EXISTS (
            SELECT * 
            FROM itemData as itemData2 
                INNER JOIN fields ON fields.fieldID = itemData2.fieldID 
            WHERE fields.fieldName = "language" 
                AND itemData.itemID = itemData2.itemID
        )
