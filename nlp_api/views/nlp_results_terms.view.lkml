view: nlp_results_terms {
  label: "*Preferred Term Filter"
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT
          clinical_notes_nlp_results.id  AS observation_id,
          (DATE_ADD(DATE(clinical_notes_nlp_results.dob), INTERVAL -139 YEAR)) || clinical_notes_nlp_results.sex  AS patient_id,
          regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ') AS original_term,
          clinical_notes_nlp_results__entity_mentions.text.beginOffset AS text_begin_offset

      FROM `@{NLP_RESULTS_SCOPED_TABLE_PATH}`
           AS clinical_notes_nlp_results

      LEFT JOIN UNNEST(clinical_notes_nlp_results.entityMentions) as clinical_notes_nlp_results__entity_mentions

      WHERE {% condition filter_on_original_term %} regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ') {% endcondition %} AND


      ((EXTRACT(YEAR FROM clinical_notes_nlp_results.dob )) >= 2058
      AND (EXTRACT(YEAR FROM DATE_ADD(DATE(clinical_notes_nlp_results.admission_date), INTERVAL -184 YEAR) )) >= 1996
      AND (DATE_DIFF(CURRENT_DATE(), DATE (DATE_ADD(DATE(clinical_notes_nlp_results.dob), INTERVAL -139 YEAR)), YEAR) + 40) > 0
      AND (TIMESTAMP_DIFF((DATE_ADD(DATE(clinical_notes_nlp_results.discharge_date), INTERVAL -184 YEAR))  ,
      (DATE_ADD(DATE(clinical_notes_nlp_results.admission_date), INTERVAL -184 YEAR)) , DAY)) >= 0
      AND (EXTRACT(YEAR FROM DATE_ADD(DATE(clinical_notes_nlp_results.dob), INTERVAL -139 YEAR) )) < 2022)
      GROUP BY
          1, 2, 3, 4
      ORDER BY
          1
      --LIMIT 500
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: unique_id {
    hidden: yes
    type: string
    sql:  ${observation_id} || ${patient_id} || ${text_begin_offset};;
  }

  dimension: observation_id {
    hidden: yes
    type: number
    sql: ${TABLE}.observation_id ;;
  }

  dimension: patient_id {
    hidden: yes
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: text_begin_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.text_begin_offset ;;
  }

  dimension: original_term {
    label: "Filtered Text"
    type: string
    #hidden: yes
    sql: ${TABLE}.original_term ;;
  }

  measure: filtered_text_mention_count {
    type: count
    description: "Number of appearances of the mentioned term"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: filtered_text_observation_count {
    type: count_distinct
    description: "Number of distinct observations"
    sql: ${observation_id} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: filtered_text_distinct_count {
    type: count_distinct
    description: "Number of distinct terms"
    sql: ${original_term} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: filtered_patient_distinct_count {
    type: count_distinct
    description: "Number of distinct patients"
    sql: ${patient_id} ;;
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: text_list {
    label: "Filtered Text List"
    description: "All original flagged terms"
    type: list
    list_field: original_term
  }

  filter: filter_on_original_term {
    type: string
    sql: {% condition filter_on_original_term %} ${original_term} {% endcondition %} ;;
  }

  set: detail {
    fields:
    [clinical_notes_nlp_results.patient_id,
      clinical_notes_nlp_results.age_tier,
      clinical_notes_nlp_results.sex,
      clinical_notes_nlp_results.service,
      clinical_notes_nlp_results.admission_offset_date,
      clinical_notes_nlp_results.discharge_offset_date
    ]
  }
}
