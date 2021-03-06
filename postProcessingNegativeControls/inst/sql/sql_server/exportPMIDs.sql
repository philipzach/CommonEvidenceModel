SELECT DISTINCT a.MAPPING_TYPE, a.OUTCOME_OF_INTEREST_CONCEPT_ID,
  a.OUTCOME_OF_INTEREST_CONCEPT_NAME, a.UNIQUE_IDENTIFIER AS PMID
FROM @adeSummaryData a
ORDER BY a.MAPPING_TYPE, a.UNIQUE_IDENTIFIER, a.OUTCOME_OF_INTEREST_CONCEPT_NAME
