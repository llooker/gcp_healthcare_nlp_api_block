view: kaggle_nlp_results_vocab {
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT
          kaggle_clinical_notes_nlp_results__entities.entityId  AS kaggle_clinical_notes_nlp_results__entities_entity_id,
          kaggle_clinical_notes_nlp_results__entities.preferredTerm  AS kaggle_clinical_notes_nlp_results__entities_preferred_term,
          kaggle_clinical_notes_nlp_results__entities__vocabulary_codes  AS kaggle_clinical_notes_nlp_results__entities__vocabulary_codes_vocab_codes_linked
      FROM `looker-private-demo.healthcare_api_sandbox.kaggle_clinical_notes_nlp_results`
           AS kaggle_clinical_notes_nlp_results
      LEFT JOIN UNNEST(kaggle_clinical_notes_nlp_results.entities) as kaggle_clinical_notes_nlp_results__entities
      LEFT JOIN UNNEST(kaggle_clinical_notes_nlp_results__entities.vocabularyCodes) as kaggle_clinical_notes_nlp_results__entities__vocabulary_codes
      GROUP BY
          1,
          2,
          3
      ORDER BY
          3
      LIMIT 500
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: entity_id {
    hidden: yes
    type: string
    sql: ${TABLE}.kaggle_clinical_notes_nlp_results__entities_entity_id ;;
  }

  dimension: preferred_term {
    hidden: yes
    type: string
    #sql: ${TABLE}.kaggle_clinical_notes_nlp_results__entities_preferred_term ;;
    sql: regexp_replace(LOWER(${TABLE}.kaggle_clinical_notes_nlp_results__entities_preferred_term),"[^a-zA-Z0-9 -]",'');;
  }

  dimension: vocab_codes {
    hidden: yes
    type: string
    sql: ${TABLE}.kaggle_clinical_notes_nlp_results__entities__vocabulary_codes_vocab_codes_linked ;;
    link: {
      label: "Google this Vocabulary"
      url: "https://www.google.com/search?q={{value | url_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  dimension: kaggle_clinical_notes_nlp_results__entities__vocabulary_codes {
    group_label: "Vocab Codes"
    label: "Vocab Codes (String)"
    hidden: yes
    type: string
    sql: ${vocab_codes} ;;
    # link: {
    #   label: "Google this Vocabulary"
    #   url: "https://www.google.com/search?q={{value | url_encode}}"
    #   icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    # }
  }

  dimension: vocab_codes_linked {
    group_label: "Vocab Codes"
    label: "Vocab Codes (String)"
    type: string
    sql: ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} ;;

    link: {
      label: "Google this Vocabulary Code"
      url: "https://www.google.com/search?q={{value | url_encode}}+code"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  measure: vocabulary_codes_list {
    type: list
    list_field: kaggle_clinical_notes_nlp_results__entities__vocabulary_codes
  }

  dimension: vocabulary {
    group_label: "Vocab Codes"
    label: "Vocab Source (Unnested)"
    type: string
    sql: CASE
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'FMA/%' THEN 'Foundational Model of Anatomy'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'GO/%' THEN 'Gene Ontology'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'HGNC/%' THEN 'HUGO Gene Nomenclature Committee'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'HPO/%' THEN 'Human Phenotype Ontology'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'ICD9CM/%' THEN 'ICD-9-CM'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'MSH/%' THEN 'MeSH'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'MTH/%' THEN 'Metathesaurus Names'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'NCBI/%' THEN 'NCBI Taxonomy'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'NCI/%' THEN 'NCI Thesaurus'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'OMIM/%' THEN 'Online Mendelian Inheritance in Man'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'RXNORM/%' THEN 'RXNORM'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'LNC/%' THEN 'LOINC'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'ICD10PCS/%' THEN 'ICD-10 Procedure Coding System'
        WHEN ${kaggle_clinical_notes_nlp_results__entities__vocabulary_codes} LIKE 'VANDF/%' THEN 'National Drug File'
        ELSE 'No Code Available' END ;;
    link: {
      label: "Google this Vocabulary Source"
      url: "https://www.google.com/search?q={{value | url_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  set: detail {
    fields: [entity_id, preferred_term, vocab_codes]
  }
}

#explore: nlp_results_vocab {}
