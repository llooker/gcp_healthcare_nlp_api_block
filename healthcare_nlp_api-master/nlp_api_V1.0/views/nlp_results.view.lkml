view: nlp_results {
  view_label: "NLP Entity Mentions"
  sql_table_name: `looker-private-demo.healthcare_api_sandbox.nlp_results`
    ;;

  dimension: id {
    primary_key: yes
    label: "Observation ID"
    type: string
    sql: ${TABLE}.observationId ;;

    link: {
      label: "Patient View for {{ document_reference.patient_id._value }}"
      url: "https://demoexpo.looker.com/dashboards-next/967?Patient+ID={{ document_reference.patient_id._value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: raw_text {
    description: "This is the raw observation text from each of the clinical note documents."
    type: string
    sql: ${TABLE}.rawText ;;
  }


  dimension: text_highlighted {
    hidden: no  # UNHIDDEN
    label: "Text (Highlighted) Processed by NLP"
    sql: ${raw_text} ;;
    html:
          {% assign w = nlp_results__entity_mentions.text_list | split: '|RECORD|' %}

          {% if w[0] %} {% assign w0 = w[0] %} {% else %} {% assign w0 = 'zzzzzzz' %} {% endif %}
          {% if w[1] %} {% assign w1 = w[1] %} {% else %} {% assign w1 = 'zzzzzzz' %} {% endif %}
          {% if w[2] %} {% assign w2 = w[2] %} {% else %} {% assign w2 = 'zzzzzzz' %} {% endif %}
          {% if w[3] %} {% assign w3 = w[3] %} {% else %} {% assign w3 = 'zzzzzzz' %} {% endif %}
          {% if w[4] %} {% assign w4 = w[4] %} {% else %} {% assign w4 = 'zzzzzzz' %} {% endif %}
          {% if w[5] %} {% assign w5 = w[5] %} {% else %} {% assign w5 = 'zzzzzzz' %} {% endif %}
          {% if w[6] %} {% assign w6 = w[6] %} {% else %} {% assign w6 = 'zzzzzzz' %} {% endif %}
          {% if w[7] %} {% assign w7 = w[7] %} {% else %} {% assign w7 = 'zzzzzzz' %} {% endif %}
          {% if w[8] %} {% assign w8 = w[8] %} {% else %} {% assign w8 = 'zzzzzzz' %} {% endif %}
          {% if w[9] %} {% assign w9 = w[9] %} {% else %} {% assign w9 = 'zzzzzzz' %} {% endif %}
          {% if w[10] %} {% assign w10 = w[10] %} {% else %} {% assign w10 = 'zzzzzzz' %} {% endif %}
          {% if w[11] %} {% assign w11 = w[11] %} {% else %} {% assign w11 = 'zzzzzzz' %} {% endif %}
          {% if w[12] %} {% assign w12 = w[12] %} {% else %} {% assign w12 = 'zzzzzzz' %} {% endif %}
          {% if w[13] %} {% assign w13 = w[13] %} {% else %} {% assign w13 = 'zzzzzzz' %} {% endif %}
          {% if w[14] %} {% assign w14 = w[14] %} {% else %} {% assign w14 = 'zzzzzzz' %} {% endif %}
          {% if w[15] %} {% assign w15 = w[15] %} {% else %} {% assign w15 = 'zzzzzzz' %} {% endif %}
          {% if w[16] %} {% assign w16 = w[16] %} {% else %} {% assign w16 = 'zzzzzzz' %} {% endif %}
          {% if w[17] %} {% assign w17 = w[17] %} {% else %} {% assign w17 = 'zzzzzzz' %} {% endif %}
          {% if w[18] %} {% assign w18 = w[18] %} {% else %} {% assign w18 = 'zzzzzzz' %} {% endif %}
          {% if w[19] %} {% assign w19 = w[19] %} {% else %} {% assign w19 = 'zzzzzzz' %} {% endif %}
          {% if w[20] %} {% assign w20 = w[20] %} {% else %} {% assign w20 = 'zzzzzzz' %} {% endif %}
          {% if w[21] %} {% assign w21 = w[21] %} {% else %} {% assign w21 = 'zzzzzzz' %} {% endif %}
          {% if w[22] %} {% assign w22 = w[22] %} {% else %} {% assign w22 = 'zzzzzzz' %} {% endif %}
          {% if w[23] %} {% assign w23 = w[23] %} {% else %} {% assign w23 = 'zzzzzzz' %} {% endif %}
          {% if w[24] %} {% assign w24 = w[24] %} {% else %} {% assign w24 = 'zzzzzzz' %} {% endif %}
          {% if w[25] %} {% assign w25 = w[25] %} {% else %} {% assign w25 = 'zzzzzzz' %} {% endif %}

          {% if w[26] %} {% assign w26 = w[26] %} {% else %} {% assign w26 = 'zzzzzzz' %} {% endif %}
          {% if w[27] %} {% assign w27 = w[27] %} {% else %} {% assign w27 = 'zzzzzzz' %} {% endif %}

          {% assign h0 = w0 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h1 = w1 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h2 = w2 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h3 = w3 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h4 = w4 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h5 = w5 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h6 = w6 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h7 = w7 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h8 = w8 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h9 = w9 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h10 = w10 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h11 = w11 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h12 = w12 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h13 = w13 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h14 = w14 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h15 = w15 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h16 = w16 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h17 = w17 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h18 = w18 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h19 = w19 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h20 = w20 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h21 = w21 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h22 = w22 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h23 = w23 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h24 = w24 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h25 = w25 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h26 = w26 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h27 = w27 | prepend: '<mark>' | append: '</mark>' %}
          <div>{{value | replace:w0, h0
              | replace: w1, h1
              | replace: w2, h2
              | replace: w3, h3
              | replace: w4, h4
              | replace: w5, h5
              | replace: w6, h6
              | replace: w7, h7
              | replace: w8, h8
              | replace: w9, h9
              | replace: w10, h10
              | replace: w11, h11
              | replace: w12, h12
              | replace: w13, h13
              | replace: w14, h14
              | replace: w15, h15
              | replace: w16, h16
              | replace: w17, h17
              | replace: w18, h18
              | replace: w19, h19
              | replace: w20, h20
              | replace: w21, h21
              | replace: w22, h22
              | replace: w23, h23
              | replace: w24, h24
              | replace: w25, h25
              | replace: w26, h26
              | replace: w27, h27
              }}</div>
          ;;
  }

  dimension: text_highlighted_trim {
    sql: TRIM(${text_highlighted}) ;;
    type: string
  }

  ##Hidden
  dimension: entities {
    hidden: yes
    sql: ${TABLE}.entities ;;
  }

  ##Hidden
  dimension: entity_mentions {
    hidden: yes
    sql: ${TABLE}.entityMentions ;;
  }


  ##Hidden
  dimension: relationships {
    hidden: yes
    sql: ${TABLE}.relationships ;;
  }

  measure: count {
    hidden: yes
    label: "Number of Observations"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }
}

#Hidden
# view: nlp_results__relationships {
#   dimension: confidence {
#     type: number
#     sql: ${TABLE}.confidence ;;
#   }

#   dimension: object_id {
#     type: number
#     sql: ${TABLE}.objectId ;;
#   }

#   dimension: subject_id {
#     type: number
#     sql: ${TABLE}.subjectId ;;
#   }
# }

# --------------------------------------------------------------------------------------------
# Entity is being creaed as a separate table and joined to Entity Mentions
# --------------------------------------------------------------------------------------------
# view: nlp_results__entities {
#   view_label: "GCP NLP Response"

#   dimension: entity_primary_key {
#     group_label: "Entities"
#     primary_key: yes
#     hidden: no
#     sql: ${nlp_results.id} || '-' || ${entity_id}  ;;
#   }

#   dimension: entity_id {
#     group_label: "Entities"
#     type: string
#     sql: ${TABLE}.entityId ;;
#   }

#   dimension: preferred_term {
#     group_label: "Entities"
#     type: string
#     sql: ${TABLE}.preferredTerm ;;
#   }

#   dimension: vocabulary_codes {
#     hidden: yes
#     group_label: "Entities"
#     type: string
#     sql: ${TABLE}.vocabularyCodes ;;
#   }

#   dimension: vocabulary_codes_string {
#     label: "Vocabulary Codes"
#     group_label: "Entities"
#     type: string
#     sql: ARRAY_TO_STRING(${TABLE}.vocabularyCodes, ', ') ;;
#   }

#   measure: count {
#     group_label: "Entities"
#     label: "Number of Entities"
#     type: count_distinct
#     sql: ${entity_primary_key} ;;
#   }
# }

view: nlp_results__entity_mentions {
  view_label: "NLP Entity Mentions"

  # set: detail {
  #   fields: [nlp_response.id, observation_fop_fhir.text, mention_id, text_content, type, assessment]
  # }

# ----------------------------------------------------------------------------------------
# Core Entity Mentions View
# ----------------------------------------------------------------------------------------
  dimension: entity_mentions_primary_key {
    primary_key: yes
    hidden: yes
    sql: ${nlp_results.id} || '-' || ${mention_id}  ;;
  }

  dimension: mention_id {
    label: "Mention ID"
    type: number
    sql: ${TABLE}.mentionId ;;
  }

  dimension: confidence {
    label: "Confidence"
    type: number
    sql: ${TABLE}.confidence ;;
    value_format_name: decimal_2
  }

  dimension: confidence_percent {
    label: "Confidence %"
    type: number
    sql: ${confidence}*100 ;;
    value_format_name: decimal_0
  }

  measure: confidence_min {
    label: "Confidence Min"
    type: min
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_max {
    label: "Confidence Max"
    type: max
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_mean {
    label: "Confidence Mean"
    type: average
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_median {
    label: "Confidence Median"
    type: median
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  dimension: type {
    full_suggestions: yes
    label: " Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    label: "Number of Unique Mentions"
    type: count_distinct
    sql: ${entity_mentions_primary_key} ;;
    # drill_fields: [detail*]
  }

  ##Hidden
  dimension: linked_entities {
    hidden: yes
    sql: ${TABLE}.linkedEntities ;;
  }

# ----------------------------------------------------------------------------------------
# Text nested field
# ----------------------------------------------------------------------------------------
  ##Hidden
  dimension: text {
    hidden: yes
    sql: ${TABLE}.text ;;
  }

  measure: text_list {
    type: list
    list_field: text_content
  }

  dimension: text_begin_offset {
    full_suggestions: yes
    label: "Text Begin Offset"
    type: number
    sql: ${text}.beginOffset ;;
    value_format_name: decimal_0
  }

  measure: min_offset {
    type: min
    sql: ${text_begin_offset} ;;
    value_format_name: decimal_0
  }

  measure: min_offset_flag {
    type: yesno
    sql: ${text_begin_offset} = ${min_offset} ;;
  }


  dimension: text_content {
    full_suggestions: yes
    label: " Text"
    type: string
    sql: ${text}.content ;;
  }

# ----------------------------------------------------------------------------------------
# Subject nested field
# ----------------------------------------------------------------------------------------
  ##Hidden
  dimension: subject {
    group_label: "Subject Assessment"
    hidden: yes
    sql: ${TABLE}.subject ;;
  }

  dimension: subject_confidence {
    group_label: "Subject Assessment"
    type: number
    sql: ${subject}.confidence ;;
    value_format_name: decimal_2
  }

  dimension: subject_value {
    full_suggestions: yes
    group_label: "Subject Assessment"
    type: string
    sql: ${subject}.value ;;
  }

# ----------------------------------------------------------------------------------------
# Temporal Assessment nested field
# ----------------------------------------------------------------------------------------
  ##Hidden
  dimension: temporal_assessment {
    group_label: "Temporal Assessment"
    hidden: yes
    sql: ${TABLE}.temporalAssessment ;;
  }

  dimension: temporal_assessment_confidence {
    label: "Temporal Confidence"
    group_label: "Temporal Assessment"
    type: number
    sql: ${temporal_assessment}.confidence ;;
    value_format_name: decimal_2
  }

  dimension: temporal_assessment_value {
    full_suggestions: yes
    label: "Temporal Value"
    group_label: "Temporal Assessment"
    type: string
    sql: ${temporal_assessment}.value ;;
  }

# ----------------------------------------------------------------------------------------
# Certainty Assessment nested field
# ----------------------------------------------------------------------------------------
  ##Hidden
  dimension: certainty_assessment {
    group_label: "Certainty Assessment"
    hidden: yes
    sql: ${TABLE}.certaintyAssessment ;;
  }

  dimension: certainty_assessment_confidence {
    label: "Certainty Confidence"
    group_label: "Certainty Assessment"
    type: number
    sql: ${certainty_assessment}.confidence ;;
    value_format_name: decimal_2
  }

  dimension: certainty_assessment_value {
    full_suggestions: yes
    label: "Certainty Value"
    group_label: "Certainty Assessment"
    type: string
    sql: ${certainty_assessment}.value ;;
  }

# ----------------------------------------------------------------------------------------
# Concatenation
# ----------------------------------------------------------------------------------------
  dimension: assessment {
    type: string
    group_label: "Assessment (Concat'ed)"
    description: "Concatenates the Certainty, Subject, and Temporal into one field"
    sql: 'Certainty: '||${certainty_assessment_value}||'; Subject: '||${subject_value}||'; Temporal: '||${temporal_assessment_value};;
  }

  dimension: assessment_short {
    type: string
    group_label: "Assessment (Concat'ed)"
    description: "Short version of 'assessment' dimension, without labels"
    sql: ${certainty_assessment_value}||'/'||${subject_value}||'/'||${temporal_assessment_value};;
  }


}

view: nlp_results__entity_mentions__linked_entities {
  view_label: "NLP Entity Mentions"
  dimension: entity_id {
    hidden: yes   #foregin key to entity & entity preferred terms
    group_label: "Entity Mentions: Linked Entities"
    type: string
    sql: ${TABLE}.entityId ;;
  }
}

##Hidden
# view: nlp_results__entity_mentions__subject {
#   dimension: confidence {
#     type: number
#     sql: ${TABLE}.confidence ;;
#   }

#   dimension: value {
#     type: string
#     sql: ${TABLE}.value ;;
#   }
# }

##Hidden
# view: nlp_results__entity_mentions__temporal_assessment {
#   dimension: confidence {
#     type: number
#     sql: ${TABLE}.confidence ;;
#   }

#   dimension: value {
#     type: string
#     sql: ${TABLE}.value ;;
#   }
# }

##Hidden
# view: nlp_results__entity_mentions__certainty_assessment {
#   dimension: confidence {
#     type: number
#     sql: ${TABLE}.confidence ;;
#   }

#   dimension: value {
#     type: string
#     sql: ${TABLE}.value ;;
#   }
# }

##Hidden
# view: nlp_results__entity_mentions__text {
#   dimension: begin_offset {
#     type: number
#     sql: ${TABLE}.beginOffset ;;
#   }

#   dimension: content {
#     type: string
#     sql: ${TABLE}.content ;;
#   }
# }
