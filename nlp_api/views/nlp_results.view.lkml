####################################################
# The name of this view in Looker is "NLP Results"
view: clinical_notes_nlp_results {
  label: "(1) NLP Results - Overview"
  sql_table_name: `@{NLP_RESULTS_SCOPED_TABLE_PATH}`
    ;;
  drill_fields: [id]

######################  PRIMARY KEY ################

  dimension: id {
    primary_key: yes
    label: "* Observation ID"
    type: number
    sql: ${TABLE}.id ;;
    full_suggestions: yes
  }

### Sample LookML Code, if you've brought in Patient ID ###
  # dimension: patient_id {
  #   label: "Patient ID"
  #   type: string
  #   sql: ${dob_offset_raw} || ${sex} ;;
  #   full_suggestions: yes
  #   link: {
  #     label: "See Patient View for {{ value }}"
  #     url: "/dashboards-next/healthcare_nlp_api_2.0::nlp_patient_view_2_0?Patient+ID={{ value | encode_uri }}"
  #     icon_url: "http://www.looker.com/favicon.ico"
  #   }

  # }

### Sample LookML Code, if you've pre-processed dates ###
######################  DATES ######################

  # dimension_group: admission {
  #   # hidden: yes
  #   type: time
  #   description: "%E4Y-%m-%d"
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.admission_date ;;
  # }

    # dimension_group: discharge {
  #   hidden: yes
  #   type: time
  #   description: "%E4Y-%m-%d"
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.discharge_date ;;
  # }

  # dimension_group: dob {
  #   hidden: yes
  #   type: time
  #   description: "%E4Y-%m-%d"
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.dob ;;
  # }

### Sample LookML Code, if you've pre-processed other data elements ###
###################### ADDITIONAL PROCESSED TEXT ################

  # dimension: service {
  #   label: "Service Type"
  #   type: string
  #   sql: IFNULL(regexp_replace(LOWER(${TABLE}.service),"[^a-zA-Z0-9 -]",' '), "NA") ;;
  #   full_suggestions: yes
  # }

  # dimension: sex {
  #   label: "Sex"
  #   type: string
  #   sql: ${TABLE}.sex ;;
  #   full_suggestions: yes
  # }

  # dimension_group: los {
  #   group_label: "Length of Stay"
  #   label: "LOS"
  #   type: duration
  #   intervals: [hour, day]
  #   sql_start: ${admission_offset_date} ;;
  #   sql_end: ${discharge_offset_date}  ;;
  # }

  # measure: average_los_days {
  #   type: average
  #   sql: ${days_los} ;;
  #   #group_label: "Length of Stay"
  #   label: "Average LOS in Days"
  #   value_format_name: decimal_1
  # }

  # dimension: age {
  #   label: "Age"
  #   type: number
  #   sql: DATE_DIFF(CURRENT_DATE(), DATE ${dob_offset_date}, YEAR) + 40 ;;
  # }

  # dimension: age_tier {
  #   label: "Age Tier"
  #   type: tier
  #   tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
  #   style: integer
  #   sql: ${age} ;;
  #   full_suggestions: yes
  # }

###################### ENTITIES ######################

  dimension: entities {
    hidden: yes
    sql: ${TABLE}.entities ;;
  }

  dimension: entity_mentions {
    hidden: yes
    sql: ${TABLE}.entityMentions ;;
  }

###################### CLINICAL NOTES TEXT ######################

### Sample LookML Code, for pre-processed text ###

# dimension: preprocessed_text {
  #   group_label: "Text"
  #   label: "* Preprocessed Text"
  #   type: string
  #   sql: ${TABLE}.preprocessed_text ;;
  # }

  dimension: raw_text {
    group_label: "* Term"
    label: "Unprocessed Text"
    type: string
    sql: ${TABLE}.raw_text ;;
  }

### Text Highlighting for Processed Clinical Note ###
  dimension: text_highlighted {
    hidden: no
    group_label: "* Term"
    label: "Text (Highlighted) Processed by NLP API"
    sql: ${raw_text} ;;
    html:
          {% assign problems = clinical_notes_nlp_results__entity_mentions.text_list_problem | split: '|RECORD|' %}
          {% assign medicines = clinical_notes_nlp_results__entity_mentions.text_list_medicine | split: '|RECORD|' %}
          {% assign history = clinical_notes_nlp_results__entity_mentions.text_list_clinical_history | split: '|RECORD|' %}

          {% assign parts = value | split: ' ' %}
          {% for part in parts %}
            {% assign downPart = part | downcase | remove: "," | remove: "." | remove: "/" | remove: "-" | remove: ";" %}
            {% if problems contains downPart %}
              <mark style="color: white; background-color: #4285F4">{{ part }}</mark>
            {% elsif medicines contains downPart %}
              <mark style="color: white; background-color: #0F9D58">{{ part }}</mark>
            {% elsif history contains downPart %}
              <mark style="color: white; background-color: #F4B400">{{ part }}</mark>
            {% else %}
              <span>{{part}}</span>
            {% endif %}
          {% endfor %}
        ;;
  }

  dimension: relationships {
    hidden: yes
    sql: ${TABLE}.relationships ;;
  }

  measure: count {
    label: "Observation Count"
    type: count
    drill_fields: [id]
  }
}

# The name of this view in Looker is "Clinical Notes Nlp Results Entities"
view: clinical_notes_nlp_results__entities {
  label: "NLP Results - Entity Mentions"
  drill_fields: [entity_id]

  dimension: entity_id {
    primary_key: yes
    label: "* Entity ID"
    type: string
    sql: ${TABLE}.entityId ;;
  }

  dimension: preferred_term {
    type: string
    label: "Preferred Term"
    group_label: "* Term"
    description: "This is the normalized medical term output from the NLP API."
    #sql: ${TABLE}.preferredTerm ;;
    sql: regexp_replace(LOWER(${TABLE}.preferredTerm),"[^a-zA-Z0-9 -]",'');;
  }

  dimension: vocabulary_codes {
    hidden: yes
    sql: ${TABLE}.vocabularyCodes ;;
  }
}

# The name of this view in Looker is "Clinical Notes Nlp Results Entity Mentions"
view: clinical_notes_nlp_results__entity_mentions {
  label: "NLP Results - Entity Mentions"

  dimension: entity_mentions_primary_key {
    primary_key: yes
    hidden: yes
    sql: ${clinical_notes_nlp_results.id} || '-' || ${mention_id}  ;;
  }

  measure: term_mention_count {
    type: count
    #sql: ${entity_mentions_primary_key} ;;
    value_format_name: decimal_0
    drill_fields: [clinical_notes_nlp_results.patient_id,
                   clinical_notes_nlp_results.age_tier,
                   clinical_notes_nlp_results.sex,
                   clinical_notes_nlp_results.service,
                   clinical_notes_nlp_results.admission_offset_date,
                   clinical_notes_nlp_results.discharge_offset_date
                   ]
  }

  dimension: mention_id {
    hidden: yes
    type: number
    sql: ${TABLE}.mentionId ;;
  }

  dimension: linked_entities {
    hidden: yes
    sql: ${TABLE}.linkedEntities ;;
  }

############## CERTAINTY ASSESSMENT, SUBJECT, & TEMPORAL################
  dimension: certainty_assessment__confidence {
    type: number
    sql: ${TABLE}.certaintyAssessment.confidence ;;
    group_label: "* Certainty Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: certainty_assessment__value {
    type: string
    sql: ${TABLE}.certaintyAssessment.value ;;
    group_label: "* Certainty Assessment"
    group_item_label: "Value"
    full_suggestions: yes
    description: "This provides the overall certainty of the preferred term in relation to the subject/temporal value: CONDITIONAL, LIKELY, SOMEWHAT LIKELY, SOMEWHAT UNLIKELY, UNCERTAIN, UNLIKELY "
  }

  dimension: subject__confidence {
    type: number
    sql: ${TABLE}.subject.confidence ;;
    group_label: "* Subject Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: subject__value {
    type: string
    sql: ${TABLE}.subject.value ;;
    full_suggestions: yes
    group_label: "* Subject Assessment"
    group_item_label: "Value"
  }

  dimension: temporal_assessment__confidence {
    type: number
    sql: ${TABLE}.temporalAssessment.confidence ;;
    group_label: "* Temporal Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: temporal_assessment__value {
    type: string
    sql: ${TABLE}.temporalAssessment.value ;;
    full_suggestions: yes
    group_label: "* Temporal Assessment"
    group_item_label: "Value"
    description: "This provides the temporal value of the preferred term: ALLERGY, CLINICAL HISTORY, CURRENT, FAMILY HISTORY, UPCOMING "
  }

###################### CONFIDENCE METRICS ###########################
  dimension: confidence {
    label: "Overall Confidence"
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: confidence_percent {
    label: "Overall Confidence %"
    type: number
    sql: ${confidence}*100 ;;
    value_format_name: decimal_0
  }

  measure: confidence_min {
    group_label: "Overal Confidence Metrics"
    label: "Confidence Min"
    type: min
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_max {
    group_label: "Overal Confidence Metrics"
    label: "Confidence Max"
    type: max
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_mean {
    group_label: "Overal Confidence Metrics"
    label: "Confidence Mean"
    type: average
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_median {
    group_label: "Overal Confidence Metrics"
    label: "Confidence Median"
    type: median
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

###################### TEXT ANALYSIS #################################
  dimension: text__begin_offset {
    type: number
    sql: ${TABLE}.text.beginOffset ;;
    group_label: "* Term"
    group_item_label: "Begin Offset"
  }

  measure: text_location {
    hidden: yes
    type: sum
    sql: ${text__begin_offset} ;;
  }

  dimension: text__content {
    full_suggestions: yes
    type: string
    sql: regexp_replace(LOWER(${TABLE}.text.content),"[^a-zA-Z0-9 -]",' ');;
    #sql: ${TABLE}.text.content ;;
    group_label: "* Term"
    label: "Original Term"
    #group_item_label: "Content"
    link: {
      label: "See Term View for {{ value }}"
      url: "/dashboards-next/gcp_healthcare_nlp_api_block::nlp_term_view?Filter+on+Original+Term=%25{{ value | url_encode }}%25"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: text__content_medicine {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_current_medication} = True THEN ${text__content} ELSE NULL END;;
    group_label: "* Term"
    group_item_label: "Original Term - Medication"
  }

  dimension: text__content_problem {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_current_problem} = True THEN ${text__content} ELSE NULL END;;
    group_label: "* Term"
    group_item_label: "Original Term - Problem"
  }

  dimension: text__content_clinical_history {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_clinical_history} = True THEN ${text__content} ELSE NULL END;;
    group_label: "* Term"
    group_item_label: "Original Term - Clinical History"
  }

  measure: text_list {
    label: "Text List"
    description: "All original flagged terms"
    type: list
    list_field: text__content
    order_by_field: confidence_mean
    #filters: [type  = "PROBLEM"]
  }

  measure: text_list_medicine {
    description: "Flagged terms, medication only"
    type: list
    list_field: text__content_medicine
    order_by_field: confidence_mean
  }

  measure: text_list_problem {
    description: "Flagged terms, problems or conditions only"
    type: list
    list_field: text__content_problem
    order_by_field: confidence_mean
  }

  measure: text_list_clinical_history {
    description: "Flagged terms, clinical history only"
    type: list
    list_field: text__content_clinical_history
    order_by_field: confidence_mean
  }

###################### TEXT TYPE CATEGORIZATION #######################
  dimension: type {
    type: string
    sql: regexp_replace(LOWER(${TABLE}.type),"[^a-zA-Z0-9 -]",' ') ;;
    group_label: "* Term"
    label: "Term Type Detail"
  }

  dimension: type_category {
    full_suggestions: yes
    group_label: "* Term"
    label: "Term Type Category"
    type: string
    sql: CASE
              WHEN ${type} LIKE 'bm%' THEN 'BM Related'
              WHEN ${type} LIKE 'med %' THEN 'Medication Related'
              WHEN ${type} = 'medicine' THEN 'Medication'
              WHEN ${type} LIKE 'procedure%' THEN 'Procedure Related'
              WHEN ${type} LIKE 'lab%' THEN 'Lab Related'
              WHEN ${type} = 'body function' THEN 'Body Function or Measurement'
              WHEN ${type} = 'body measurement' THEN 'Body Function or Measurement'
              WHEN ${type} = 'problem' THEN 'Problem or Condition'
              WHEN ${type} = 'family' THEN 'Family Related'
              WHEN ${type} LIKE 'bf%' THEN 'BF Related'
              WHEN ${type} = 'severity' THEN 'Severity'
              WHEN ${type} = 'substance abuse' THEN 'Substance Abuse'
              WHEN ${type} = 'anatomical structure' THEN 'Anatomical Structure'
              WHEN ${type} = 'medical device' THEN 'Medical Device'
              ELSE ${type} END
              ;;
    }

##########################  ALLERGY ANALYSIS ##########################
  dimension: is_allergy_related {
    hidden: yes
    type: string
    sql: CASE
              WHEN (regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ')) LIKE '%allergies%'
              OR (regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ')) LIKE '%allergy%'
              OR (regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ')) LIKE '%allergic%'
              OR (regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ')) LIKE '%intolerant%'
              OR (regexp_replace(LOWER(clinical_notes_nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ')) LIKE '%hypersensitivity%' THEN 1
              ELSE 0 END
    ;;
  }

  dimension: is_certainty_likely {
    hidden: yes
    type: string
    sql: CASE WHEN ${certainty_assessment__value} = 'LIKELY' THEN 'Yes'
              WHEN ${certainty_assessment__value} = 'SOMEWHAT_LIKELY'  THEN 'Yes' ELSE 'No' END ;;
  }

  dimension: has_allergies {
    type: yesno
    sql:
        (${is_allergy_related} = 1
    AND ${is_certainty_likely} = 'Yes'
    AND ${subject__value}='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${type} = 'problem')

    OR

    (   ${is_certainty_likely} = 'Yes'
    AND ${subject__value}='PATIENT'
    AND ${temporal_assessment__value} = 'ALLERGY')
  ;;
    description: "Patient currently has a LIKELY or SOMEWHAT LIKELY probability of allergies."
  }

##########################  OTHER FLAGS ##########################

  dimension: is_patient_current_medication {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${type} = 'medicine'
    AND ${confidence_percent} >= 90
    )
  ;;
    description: "Patient currently has a LIKELY or SOMEWHAT LIKELY probability of taking these flagged medications."
  }

  dimension: is_patient_clinical_history {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CLINICAL_HISTORY'
    AND ${confidence_percent} >= 90
    )
    --AND ${type} = 'procedure'
  ;;
    description: "Patient is LIKELY to have flagged clinical history."
  }

  dimension: is_patient_current_problem {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${confidence_percent} >= 90
    AND ${type} = 'problem'
    )
  ;;
    description: "Patient is LIKELY to have flagged clinical history."
  }

########################################################################

}

# The name of this view in Looker is "Clinical Notes Nlp Results Relationships" - HIDDEN
view: clinical_notes_nlp_results__relationships {

  dimension: confidence {
    hidden: yes
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: object_id {
    hidden: yes
    type: number
    sql: ${TABLE}.objectId ;;
  }

  dimension: subject_id {
    hidden: yes
    type: number
    sql: ${TABLE}.subjectId ;;
  }
}

# The name of this view in Looker is "Clinical Notes Nlp Results Entities Vocabulary Codes" - HIDDEN
view: clinical_notes_nlp_results__entities__vocabulary_codes {

  dimension: clinical_notes_nlp_results__entities__vocabulary_codes {
    hidden: yes
    type: string
    sql: clinical_notes_nlp_results__entities__vocabulary_codes ;;
  }
}

# The name of this view in Looker is "Clinical Notes Nlp Results Entity Mentions Linked Entities" - HIDDEN
view: clinical_notes_nlp_results__entity_mentions__linked_entities {

  dimension: entity_id {
    hidden: yes
    type: string
    sql: ${TABLE}.entityId ;;
  }
}
