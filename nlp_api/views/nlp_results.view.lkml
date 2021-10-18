####################################################
# The name of this view in Looker is "Kaggle Clinical Notes Nlp Results"
view: clinical_notes_nlp_results {
  label: "NLP Results - Overview"
  sql_table_name: `@{NLP_RESULTS_SCOPED_TABLE_PATH}`
    ;;
  drill_fields: [id]


######################  PRIMARY KEY ################

  dimension: id {
    primary_key: yes
    label: "(1) Observation ID"
    type: number
    sql: ${TABLE}.id ;;
    full_suggestions: yes
  }

  # dimension: patient_id {
  #   label: "(0) Patient ID"
  #   type: string
  #   sql: ${dob_offset_raw} || ${sex} ;;
  #   full_suggestions: yes
  #   link: {
  #     label: "See Patient View for {{ value }}"
  #     url: "/dashboards-next/healthcare_nlp_api_2.0::nlp_patient_view_2_0?Patient+ID={{ value | encode_uri }}"
  #     icon_url: "http://www.looker.com/favicon.ico"
  #   }

  # }

######################  DATES ######################

  dimension_group: admission {
    # hidden: yes
    type: time
    description: "%E4Y-%m-%d"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.admission_date ;;
  }

  # dimension_group: admission_offset {
  #   label: "(2) Admission"
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
  #   sql: DATE_ADD(DATE(${admission_raw}), INTERVAL -184 YEAR) ;;
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

  # dimension_group: discharge_offset {
  #   label: "(3) Discharge"
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
  #   sql: DATE_ADD(DATE(${discharge_raw}), INTERVAL -184 YEAR) ;;
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

  # dimension_group: dob_offset {
  #   hidden: yes
  #   label: "DOB"
  #   type: time
  #   description: "%E4Y-%m-%d"
  #   timeframes: [
  #     raw,
  #     date,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: DATE_ADD(DATE(${dob_raw}), INTERVAL -139 YEAR) ;;
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
  #   label: "(4) Age"
  #   type: number
  #   sql: DATE_DIFF(CURRENT_DATE(), DATE ${dob_offset_date}, YEAR) + 40 ;;
  # }

  # dimension: age_tier {
  #   label: "(5) Age Tier"
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

  #Note in this example we did some pre-processing before loading
  #to BigQuery.
  # dimension: preprocessed_text {
  #   group_label: "Text"
  #   label: "(2) Preprocessed Text"
  #   type: string
  #   sql: ${TABLE}.preprocessed_text ;;
  # }

  dimension: raw_text {
    group_label: "Text"
    label: "(1) Unprocessed Text"
    type: string
    sql: ${TABLE}.raw_text ;;
  }

# regexp_replace(LOWER(title_text),"[^a-zA-Z0-9 -]",'')



  dimension: text_highlighted_new {
    hidden: no
    group_label: "Text"
    label: "(3) Text (Highlighted) Processed by NLP API - NEW"
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

  dimension: text_highlighted {
    hidden: no
    group_label: "Text"
    label: "(3) Text (Highlighted) Processed by NLP API"
    sql: ${raw_text} ;;
    html:
          {% assign w = clinical_notes_nlp_results__entity_mentions.text_list_problem | split: '|RECORD|' %}
          {% assign m = clinical_notes_nlp_results__entity_mentions.text_list_medicine | split: '|RECORD|' %}
          {% assign s = clinical_notes_nlp_results__entity_mentions.text_list_clinical_history| split: '|RECORD|' %}

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

          {% assign h0 = w0 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h1 = w1 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h2 = w2 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h3 = w3 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h4 = w4 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h5 = w5 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h6 = w6 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h7 = w7 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h8 = w8 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h9 = w9 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h10 = w10 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h11 = w11 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h12 = w12 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h13 = w13 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h14 = w14 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h15 = w15 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h16 = w16 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h17 = w17 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h18 = w18 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h19 = w19 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h20 = w20 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h21 = w21 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h22 = w22 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h23 = w23 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h24 = w24 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h25 = w25 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h26 = w26 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}
          {% assign h27 = w27 | prepend: '<mark style="color: white; background-color: #4285F4">' | append: '</mark>' %}

          {% if m[0] %} {% assign m0 = m[0] %} {% else %} {% assign m0 = 'zzzzzzz' %} {% endif %}
          {% if m[1] %} {% assign m1 = m[1] %} {% else %} {% assign m1 = 'zzzzzzz' %} {% endif %}
          {% if m[2] %} {% assign m2 = m[2] %} {% else %} {% assign m2 = 'zzzzzzz' %} {% endif %}
          {% if m[3] %} {% assign m3 = m[3] %} {% else %} {% assign m3 = 'zzzzzzz' %} {% endif %}
          {% if m[4] %} {% assign m4 = m[4] %} {% else %} {% assign m4 = 'zzzzzzz' %} {% endif %}
          {% if m[5] %} {% assign m5 = m[5] %} {% else %} {% assign m5 = 'zzzzzzz' %} {% endif %}
          {% if m[6] %} {% assign m6 = m[6] %} {% else %} {% assign m6 = 'zzzzzzz' %} {% endif %}
          {% if m[7] %} {% assign m7 = m[7] %} {% else %} {% assign m7 = 'zzzzzzz' %} {% endif %}
          {% if m[8] %} {% assign m8 = m[8] %} {% else %} {% assign m8 = 'zzzzzzz' %} {% endif %}
          {% if m[9] %} {% assign m9 = m[9] %} {% else %} {% assign m9 = 'zzzzzzz' %} {% endif %}
          {% if m[10] %} {% assign m10 = m[10] %} {% else %} {% assign m10 = 'zzzzzzz' %} {% endif %}
          {% if m[11] %} {% assign m11 = m[11] %} {% else %} {% assign m11 = 'zzzzzzz' %} {% endif %}
          {% if m[12] %} {% assign m12 = m[12] %} {% else %} {% assign m12 = 'zzzzzzz' %} {% endif %}
          {% if m[13] %} {% assign m13 = m[13] %} {% else %} {% assign m13 = 'zzzzzzz' %} {% endif %}
          {% if m[14] %} {% assign m14 = m[14] %} {% else %} {% assign m14 = 'zzzzzzz' %} {% endif %}
          {% if m[15] %} {% assign m15 = m[15] %} {% else %} {% assign m15 = 'zzzzzzz' %} {% endif %}
          {% if m[16] %} {% assign m16 = m[16] %} {% else %} {% assign m16 = 'zzzzzzz' %} {% endif %}
          {% if m[17] %} {% assign m17 = m[17] %} {% else %} {% assign m17 = 'zzzzzzz' %} {% endif %}
          {% if m[18] %} {% assign m18 = m[18] %} {% else %} {% assign m18 = 'zzzzzzz' %} {% endif %}
          {% if m[19] %} {% assign m19 = m[19] %} {% else %} {% assign m19 = 'zzzzzzz' %} {% endif %}
          {% if m[20] %} {% assign m20 = m[20] %} {% else %} {% assign m20 = 'zzzzzzz' %} {% endif %}
          {% if m[21] %} {% assign m21 = m[21] %} {% else %} {% assign m21 = 'zzzzzzz' %} {% endif %}
          {% if m[22] %} {% assign m22 = m[22] %} {% else %} {% assign m22 = 'zzzzzzz' %} {% endif %}
          {% if m[23] %} {% assign m23 = m[23] %} {% else %} {% assign m23 = 'zzzzzzz' %} {% endif %}
          {% if m[24] %} {% assign m24 = m[24] %} {% else %} {% assign m24 = 'zzzzzzz' %} {% endif %}
          {% if m[25] %} {% assign m25 = m[25] %} {% else %} {% assign m25 = 'zzzzzzz' %} {% endif %}
          {% if m[26] %} {% assign m26 = m[26] %} {% else %} {% assign m26 = 'zzzzzzz' %} {% endif %}
          {% if m[27] %} {% assign m27 = m[27] %} {% else %} {% assign m27 = 'zzzzzzz' %} {% endif %}
          {% if m[28] %} {% assign m28 = m[28] %} {% else %} {% assign m28 = 'zzzzzzz' %} {% endif %}
          {% if m[29] %} {% assign m29 = m[29] %} {% else %} {% assign m29 = 'zzzzzzz' %} {% endif %}
          {% if m[30] %} {% assign m30 = m[30] %} {% else %} {% assign m30 = 'zzzzzzz' %} {% endif %}
          {% if m[31] %} {% assign m31 = m[31] %} {% else %} {% assign m31 = 'zzzzzzz' %} {% endif %}
          {% if m[32] %} {% assign m32 = m[32] %} {% else %} {% assign m32 = 'zzzzzzz' %} {% endif %}
          {% if m[33] %} {% assign m33 = m[33] %} {% else %} {% assign m33 = 'zzzzzzz' %} {% endif %}
          {% if m[34] %} {% assign m34 = m[34] %} {% else %} {% assign m34 = 'zzzzzzz' %} {% endif %}

          {% if m[35] %} {% assign m31 = m[35] %} {% else %} {% assign m35 = 'zzzzzzz' %} {% endif %}
          {% if m[36] %} {% assign m32 = m[36] %} {% else %} {% assign m36 = 'zzzzzzz' %} {% endif %}
          {% if m[37] %} {% assign m33 = m[37] %} {% else %} {% assign m37 = 'zzzzzzz' %} {% endif %}
          {% if m[38] %} {% assign m34 = m[38] %} {% else %} {% assign m38 = 'zzzzzzz' %} {% endif %}

          {% assign j0 = m0 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j1 = m1 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j2 = m2 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j3 = m3 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j4 = m4 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j5 = m5 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j6 = m6 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j7 = m7 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j8 = m8 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j9 = m9 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j10 = m10 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j11 = m11 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j12 = m12 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j13 = m13 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j14 = m14 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j15 = m15 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j16 = m16 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j17 = m17 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j18 = m18 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j19 = m19 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j20 = m20 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j21 = m21 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j22 = m22 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j23 = m23 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j24 = m24 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j25 = m25 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j26 = m26 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j27 = m27 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j28 = m28 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j29 = m29 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j30 = m30 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j31 = m31 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j32 = m32 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j33 = m33 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j34 = m34 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}

          {% assign j35 = m35 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j36 = m36 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j37 = m37 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}
          {% assign j38 = m38 | prepend: '<mark style="color: white; background-color:#0F9D58">' | append: '</mark>' %}

          {% if s[0] %} {% assign s0 = s[0] %} {% else %} {% assign s0 = 'zzzzzzz' %} {% endif %}
          {% if s[1] %} {% assign s1 = s[1] %} {% else %} {% assign s1 = 'zzzzzzz' %} {% endif %}
          {% if s[2] %} {% assign s2 = s[2] %} {% else %} {% assign s2 = 'zzzzzzz' %} {% endif %}
          {% if s[3] %} {% assign s3 = s[3] %} {% else %} {% assign s3 = 'zzzzzzz' %} {% endif %}
          {% if s[4] %} {% assign s4 = s[4] %} {% else %} {% assign s4 = 'zzzzzzz' %} {% endif %}
          {% if s[5] %} {% assign s5 = s[5] %} {% else %} {% assign s5 = 'zzzzzzz' %} {% endif %}
          {% if s[6] %} {% assign s6 = s[6] %} {% else %} {% assign s6 = 'zzzzzzz' %} {% endif %}
          {% if s[7] %} {% assign s7 = s[7] %} {% else %} {% assign s7 = 'zzzzzzz' %} {% endif %}
          {% if s[8] %} {% assign s8 = s[8] %} {% else %} {% assign s8 = 'zzzzzzz' %} {% endif %}
          {% if s[9] %} {% assign s9 = s[9] %} {% else %} {% assign s9 = 'zzzzzzz' %} {% endif %}
          {% if s[10] %} {% assign s10 = s[10] %} {% else %} {% assign s10 = 'zzzzzzz' %} {% endif %}
          {% if s[11] %} {% assign s11 = s[11] %} {% else %} {% assign s11 = 'zzzzzzz' %} {% endif %}
          {% if s[12] %} {% assign s12 = s[12] %} {% else %} {% assign s12 = 'zzzzzzz' %} {% endif %}
          {% if s[13] %} {% assign s13 = s[13] %} {% else %} {% assign s13 = 'zzzzzzz' %} {% endif %}
          {% if s[14] %} {% assign s14 = s[14] %} {% else %} {% assign s14 = 'zzzzzzz' %} {% endif %}
          {% if s[15] %} {% assign s15 = s[15] %} {% else %} {% assign s15 = 'zzzzzzz' %} {% endif %}
          {% if s[16] %} {% assign s16 = s[16] %} {% else %} {% assign s16 = 'zzzzzzz' %} {% endif %}
          {% if s[17] %} {% assign s17 = s[17] %} {% else %} {% assign s17 = 'zzzzzzz' %} {% endif %}
          {% if s[18] %} {% assign s18 = s[18] %} {% else %} {% assign s18 = 'zzzzzzz' %} {% endif %}
          {% if s[19] %} {% assign s19 = s[19] %} {% else %} {% assign s19 = 'zzzzzzz' %} {% endif %}
          {% if s[20] %} {% assign s20 = s[20] %} {% else %} {% assign s20 = 'zzzzzzz' %} {% endif %}
          {% if s[21] %} {% assign s21 = s[21] %} {% else %} {% assign s21 = 'zzzzzzz' %} {% endif %}
          {% if s[22] %} {% assign s22 = s[22] %} {% else %} {% assign s22 = 'zzzzzzz' %} {% endif %}
          {% if s[23] %} {% assign s23 = s[23] %} {% else %} {% assign s23 = 'zzzzzzz' %} {% endif %}
          {% if s[24] %} {% assign s24 = s[24] %} {% else %} {% assign s24 = 'zzzzzzz' %} {% endif %}
          {% if s[25] %} {% assign s25 = s[25] %} {% else %} {% assign s25 = 'zzzzzzz' %} {% endif %}
          {% if s[26] %} {% assign s26 = s[26] %} {% else %} {% assign s26 = 'zzzzzzz' %} {% endif %}
          {% if s[27] %} {% assign s27 = s[27] %} {% else %} {% assign s27 = 'zzzzzzz' %} {% endif %}

          {% assign z0 = s0 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z1 = s1 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z2 = s2 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z3 = s3 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z4 = s4 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z5 = s5 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z6 = s6 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z7 = s7 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z8 = s8 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z9 = s9 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z10 = s10 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z11 = s11 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z12 = s12 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z13 = s13 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z14 = s14 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z15 = s15 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z16 = s16 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z17 = s17 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z18 = s18 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z19 = s19 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z20 = s20 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z21 = s21 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z22 = s22 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z23 = s23 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z24 = s24 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z25 = s25 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z26 = s26 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}
          {% assign z27 = s27 | prepend: '<mark style="color: white; background-color:#F4B400">' | append: '</mark>' %}


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
              | replace: m0, j0
              | replace: m1, j1
              | replace: m2, j2
              | replace: m3, j3
              | replace: m4, j4
              | replace: m5, j5
              | replace: m6, j6
              | replace: m7, j7
              | replace: m8, j8
              | replace: m9, j9
              | replace: m10, j10
              | replace: m11, j11
              | replace: m12, j12
              | replace: m13, j13
              | replace: m14, j14
              | replace: m15, j15
              | replace: m16, j16
              | replace: m17, j17
              | replace: m18, j18
              | replace: m19, j19
              | replace: m20, j20
              | replace: m21, j21
              | replace: m22, j22
              | replace: m23, j23
              | replace: m24, j24
              | replace: m25, j25
              | replace: m26, j26
              | replace: m27, j27
              | replace: m28, j28
              | replace: m29, j29
              | replace: m30, j30
              | replace: m31, j31
              | replace: m32, j32
              | replace: m33, j33
              | replace: m34, j34
              | replace: m35, j35
              | replace: m36, j36
              | replace: m37, j37
              | replace: m38, j38
              | replace: s0, z0
              | replace: s1, z1
              | replace: s2, z2
              | replace: s3, z3
              | replace: s4, z4
              | replace: s5, z5
              | replace: s6, z6
              | replace: s7, z7
              | replace: s8, z8
              | replace: s9, z9
              | replace: s10, z10
              | replace: s11, z11
              | replace: s12, z12
              | replace: s13, z13
              | replace: s14, z14
              | replace: s15, z15
              | replace: s16, z16
              | replace: s17, z17
              | replace: s18, z18
              | replace: s19, z19
              | replace: s20, z20
              | replace: s21, z21
              | replace: s22, z22
              | replace: s23, z23
              | replace: s24, z24
              | replace: s25, z25
              | replace: s26, z26
              | replace: s27, z27
              }}</div>
          ;;
  }

  dimension: relationships {
    hidden: yes
    sql: ${TABLE}.relationships ;;
  }

###################### ADDITIONAL PROCESSED TEXT ################

  # dimension: service {
  #   label: "(6) Service Type"
  #   type: string
  #   sql: IFNULL(regexp_replace(LOWER(${TABLE}.service),"[^a-zA-Z0-9 -]",' '), "NA") ;;
  #   full_suggestions: yes
  # }

  # dimension: sex {
  #   label: "(7) Sex"
  #   type: string
  #   sql: ${TABLE}.sex ;;
  #   full_suggestions: yes
  # }

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
    label: "(0) Entity ID"
    type: string
    sql: ${TABLE}.entityId ;;
  }

  dimension: preferred_term {
    type: string
    label: "Preferred Term"
    group_label: "(1) Term"
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
    group_label: "(2) Certainty Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: certainty_assessment__value {
    type: string
    sql: ${TABLE}.certaintyAssessment.value ;;
    group_label: "(2) Certainty Assessment"
    group_item_label: "Value"
    full_suggestions: yes
    description: "This provides the overall certainty of the preferred term in relation to the subject/temporal value: CONDITIONAL, LIKELY, SOMEWHAT LIKELY, SOMEWHAT UNLIKELY, UNCERTAIN, UNLIKELY "
  }

  dimension: subject__confidence {
    type: number
    sql: ${TABLE}.subject.confidence ;;
    group_label: "(3) Subject Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: subject__value {
    type: string
    sql: ${TABLE}.subject.value ;;
    full_suggestions: yes
    group_label: "(3) Subject Assessment"
    group_item_label: "Value"
  }

  dimension: temporal_assessment__confidence {
    type: number
    sql: ${TABLE}.temporalAssessment.confidence ;;
    group_label: "(4) Temporal Assessment"
    group_item_label: "Confidence"
    value_format_name: decimal_4
  }

  dimension: temporal_assessment__value {
    type: string
    sql: ${TABLE}.temporalAssessment.value ;;
    full_suggestions: yes
    group_label: "(4) Temporal Assessment"
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
    group_label: "(1) Term"
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
    group_label: "(1) Term"
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
    group_label: "(1) Term"
    group_item_label: "Original Term - Medication"
  }

  dimension: text__content_problem {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_current_problem} = True THEN ${text__content} ELSE NULL END;;
    group_label: "(1) Term"
    group_item_label: "Original Term - Problem"
  }

  dimension: text__content_clinical_history {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_clinical_history} = True THEN ${text__content} ELSE NULL END;;
    group_label: "(1) Term"
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
    group_label: "(1) Term"
    label: "Term Type Detail"
  }

  dimension: type_category {
    full_suggestions: yes
    group_label: "(1) Term"
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
