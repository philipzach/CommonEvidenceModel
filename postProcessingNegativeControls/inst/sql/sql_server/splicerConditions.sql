IF OBJECT_ID('@storeData', 'U') IS NOT NULL DROP TABLE @storeData;

SELECT DISTINCT DESCENDANT_CONCEPT_ID AS CONCEPT_ID
INTO @storeData
FROM @vocabulary.CONCEPT_ANCESTOR ca
WHERE CAST(ca.ANCESTOR_CONCEPT_ID AS VARCHAR(50)) IN (
	SELECT SOURCE_CODE_2
	FROM @splicerData s
		JOIN @vocabulary.CONCEPT_ANCESTOR ca
			ON ca.DESCENDANT_CONCEPT_ID = s.CONCEPT_ID_1
		JOIN @vocabulary.CONCEPT c1
			ON c1.CONCEPT_ID = ca.ANCESTOR_CONCEPT_ID
			AND lower(c1.CONCEPT_CLASS_ID) = 'ingredient'
			AND c1.CONCEPT_ID IN (@conceptsOfInterest)
	WHERE SOURCE_CODE_2 IS NOT NULL
)
