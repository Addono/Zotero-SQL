-- Replaces string literals in Zotero.
-- Note: Zotero allows different types of fields to reuse the same value,
--       when filtering. If the value is used by another field not included
--       in the filter, then this will still be updated. Example:
--       * Entry before: {title: "foo", journal: "foo", description: "baz"}
--       * Replace "foo" with "bar" for all title fields
--       * Entry after: {title: "bar", journal: "bar", description: "baz"}
UPDATE itemDataValues
SET value = REPLACE(value, "replace this", "with this") -- Value to replace
WHERE valueID in (
    SELECT valueID
    FROM itemData
        INNER JOIN fieldsCombined ON itemData.fieldID = fieldsCombined.fieldID
    WHERE
        fieldName in (
            -- List of fields to filter on (by name), by default only titles
            -- will be replaced.
            "title",
        )
)
