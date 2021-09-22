view: nlp_results__entities {
  view_label: "NLP Entities"
  derived_table: {
    persist_for: "24 hours"

    sql: WITH unnested AS (
        -- unnests the entities field and de-duplicates the records
        SELECT
          nlp_results__entities.entityId  AS entities_entity_id,
          nlp_results__entities.preferredTerm  AS entities_preferred_term,
          ARRAY_TO_STRING(nlp_results__entities.vocabularyCodes, ', ')  AS entities_vocabulary_codes_string

        FROM `looker-private-demo.healthcare_api_sandbox.nlp_results` nlp_results

        LEFT JOIN UNNEST(nlp_results.entities) as nlp_results__entities
        GROUP BY 1,2,3
        )

        -- converts the array string back to an array type, so it can be unnested later
        SELECT
        *,
        SPLIT(entities_vocabulary_codes_string, ', ') AS entities_vocabulary_codes_array
        FROM unnested
     ;;
  }

  set: detail {
    fields: [nlp_results__entity_mentions.detail*, entity_id, preferred_term, vocabulary_codes_string]
  }

  measure: number_of_entities {
    label: "Number of Occurrences"
    type: count
    drill_fields: [detail*]
  }

  dimension: entity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.entities_entity_id ;;
  }

  dimension: preferred_term {
    full_suggestions: yes
    type: string
    sql: ${TABLE}.entities_preferred_term ;;
    drill_fields: [vocabulary_codes_string]
    link: {
      label: "{{value}} Condition Lookup "
      url: "https://demoexpo.looker.com/dashboards-next/1123?Condition%20Code=44054006"
      icon_url: "http://www.looker.com/favicon.ico"
    }

  }

  dimension: vocabulary_codes_string {
    label: "Vocab Codes (String)"
    type: string
    sql: ${TABLE}.entities_vocabulary_codes_string ;;
  }

  dimension: vocabulary_codes_array {
    hidden: no
    type: string
    sql: ${TABLE}.entities_vocabulary_codes_array ;;
  }

  measure: vocabulary_codes_list {
    type: list
    list_field: vocabulary_codes_array
  }

}

view: nlp_results__entities__vocabulary_codes {
  view_label: "NLP Entities"

  dimension: vocabulary_code {
    group_label: "Vocab Codes Unnested"
    label: "Vocab Code (Short)"
    type: string
    sql: entities_vocabulary_codes ;;
    #sql: entities_vocabulary_codes_array ;;
    link: {
      label: "Google this Code"
      url: "https://www.google.com/search?q={{value | uri_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  dimension: vocabulary {
    group_label: "Vocab Codes Unnested"
    label: "Vocab Source"
    type: string
    sql: CASE
        WHEN ${vocabulary_code} LIKE 'FMA/%' THEN 'Foundational Model of Anatomy'
        WHEN ${vocabulary_code} LIKE 'GO/%' THEN 'Gene Ontology'
        WHEN ${vocabulary_code} LIKE 'HGNC/%' THEN 'HUGO Gene Nomenclature Committee'
        WHEN ${vocabulary_code} LIKE 'HPO/%' THEN 'Human Phenotype Ontology'
        WHEN ${vocabulary_code} LIKE 'ICD9CM/%' THEN 'ICD-9-CM'
        WHEN ${vocabulary_code} LIKE 'MSH/%' THEN 'MeSH'
        WHEN ${vocabulary_code} LIKE 'MTH/%' THEN 'Metathesaurus Names'
        WHEN ${vocabulary_code} LIKE 'NCBI/%' THEN 'NCBI Taxonomy'
        WHEN ${vocabulary_code} LIKE 'NCI/%' THEN 'NCI Thesaurus'
        WHEN ${vocabulary_code} LIKE 'OMIM/%' THEN 'Online Mendelian Inheritance in Man'
        WHEN ${vocabulary_code} LIKE 'RXNORM/%' THEN 'RXNORM'
        WHEN ${vocabulary_code} LIKE 'LNC/%' THEN 'LOINC'
        WHEN ${vocabulary_code} LIKE 'ICD10PCS/%' THEN 'ICD-10 Procedure Coding System'
        WHEN ${vocabulary_code} LIKE 'VANDF/%' THEN 'National Drug File'
        ELSE 'unknown' END ;;
    link: {
      label: "Google this Vocabulary"
      url: "https://www.google.com/search?q={{value | uri_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  dimension: vocabulary_code_number {
    hidden: yes
    type: string
    sql: SUBSTR(${vocabulary_code},STRPOS(${vocabulary_code},'/')+1) ;;
  }

  dimension: vocabulary_code_long {
    group_label: "Vocab Codes Unnested"
    label: "Vocab Code (Long)"
    type: string
    sql: ${vocabulary}||' '||${vocabulary_code_number} ;;
    link: {
      label: "Google this Code"
      url: "https://www.google.com/search?q={{value | uri_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  dimension: vocabulary_code_link {
    # WORK IN PROGRESS - will need to manually enter correct links for every vocabulary
    hidden: yes
    group_label: "Vocab Codes Unnested"
    label: "Vocab Code Link"
    type: string
    sql:  CASE
        WHEN ${vocabulary_code} LIKE 'FMA/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'GO/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'HGNC/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'HPO/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'ICD9CM/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'MSH/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'MTH/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'NCBI/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'NCI/%' THEN 'https://ncithesaurus.nci.nih.gov/ncitbrowser/ConceptReport.jsp?dictionary=NCI_Thesaurus&ns=ncit&code='||${vocabulary_code_number}
        WHEN ${vocabulary_code} LIKE 'OMIM/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'RXNORM/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'LNC/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'ICD10PCS/%' THEN 'TBU'
        WHEN ${vocabulary_code} LIKE 'VANDF/%' THEN 'TBU'
        ELSE 'unknown' END
    ;;
    link: {
      label: "Lookup this Code"
      url: "{{value}}"
    }
  }

}
