view: document_reference {
  label: "Document Reference"

  sql_table_name: `looker-private-demo.healthcare_api_sandbox.DocumentReference`
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Observation ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    drill_fields: [document_reference__content.title]
  }

  dimension: patient_id {
    label: "Patient ID"
    type: string
    sql: ${subject}.patientID ;;

    link: {
      label: "Patient View for {{ value }}"
      url: "https://demoexpo.looker.com/dashboards-next/967?Patient+ID={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  ##Hidden
  dimension: content {
    hidden: yes
    sql: ${TABLE}.content;;
  }

  dimension: attachment {
    hidden: yes
    type: string
    sql: ${content}.title ;;
  }

  ##Hidden
  dimension: subject {
    hidden: yes
    sql: ${TABLE}.subject ;;
    #type: string
  }

  ##Hidden
  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  ##Hidden
  dimension: relates_to__target__document_reference_id {
    hidden: yes
    type: string
    sql: ${TABLE}.relatesTo.target.documentReferenceId ;;
  }

  ##Hidden
  dimension: authenticator {
    hidden: yes
    sql: ${TABLE}.authenticator ;;
  }

  ##Hidden
  dimension: author {
    hidden: yes
    sql: ${TABLE}.author ;;
  }

  ##Hidden
  dimension: category {
    hidden: yes
    sql: ${TABLE}.category ;;
  }

  ##Hidden
  dimension: context {
    hidden: yes
    sql: ${TABLE}.context ;;
  }

  ##Hidden
  dimension: custodian {
    hidden: yes
    sql: ${TABLE}.custodian ;;
  }

  ##Hidden
  dimension_group: document {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  ##Hidden
  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  ##Hidden
  dimension: doc_status {
    hidden: yes
    type: string
    sql: ${TABLE}.docStatus ;;
  }

  ##Hidden
  dimension: implicit_rules {
    hidden: yes
    type: string
    sql: ${TABLE}.implicitRules ;;
  }

  ##Hidden
  dimension: language {
    hidden: yes
    type: string
    sql: ${TABLE}.language ;;
  }

  ##Hidden
  dimension: master_identifier {
    hidden: yes
    sql: ${TABLE}.masterIdentifier ;;
  }

  ##Hidden
  dimension: meta {
    hidden: yes
    sql: ${TABLE}.meta ;;
  }

  ##Hidden
  dimension: relates_to {
    hidden: yes
    sql: ${TABLE}.relatesTo ;;
  }

  ##Hidden
  dimension: security_label {
    hidden: yes
    sql: ${TABLE}.securityLabel ;;
  }

  ##Hidden
  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }

  ##Hidden
  dimension: text {
    hidden: yes
    sql: ${TABLE}.text ;;
  }

  ##Hidden
  dimension: type {
    hidden: yes
    sql: ${TABLE}.type ;;
  }

  measure: count {
    label: "Count of Documents"
    type: count
    drill_fields: [id]
  }
}

view: document_reference__subject {
  label: "Document Reference"

  ##Hidden
  dimension: patient_id {
    hidden: yes
    label: "Patient ID"
    type: string
    sql: ${TABLE}.patientId ;;
  }

  ##Hidden
  dimension: device_id {
    hidden: yes
    type: string
    sql: ${TABLE}.deviceId ;;
  }

  ##Hidden
  dimension: display {
    hidden: yes
    type: string
    sql: ${TABLE}.display ;;
  }

  ##Hidden
  dimension: group_id {
    hidden: yes
    type: string
    sql: ${TABLE}.groupId ;;
  }

  ##Hidden
  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  ##Hidden
  dimension: practitioner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.practitionerId ;;
  }

  ##Hidden
  dimension: reference {
    hidden: yes
    type: string
    sql: ${TABLE}.reference ;;
  }

  ##Hidden
  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: document_reference__content {
  label: "Document Reference"

  dimension: attachment {
    hidden: yes
    sql: ${TABLE}.attachment ;;
  }

  dimension: title {
    label: "Title"
    type: string
    sql: ${attachment}.title ;;
  }

  dimension: format {
    hidden: yes
    sql: ${TABLE}.format ;;
  }
}

view: document_reference__content__attachment {
  label: "Document Reference"

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  #Hidden
  dimension: content_type {
    hidden: yes
    type: string
    sql: ${TABLE}.contentType ;;
  }

  #Hidden
  dimension: creation {
    hidden: yes
    type: string
    sql: ${TABLE}.creation ;;
  }

  #Hidden
  dimension: data {
    hidden: yes
    type: string
    sql: ${TABLE}.data ;;
  }

  #Hidden
  dimension: hash {
    hidden: yes
    type: string
    sql: ${TABLE}.`hash` ;;
  }

  #Hidden
  dimension: language {
    hidden: yes
    type: string
    sql: ${TABLE}.language ;;
  }

  #Hidden
  dimension: size {
    hidden: yes
    type: number
    sql: ${TABLE}.size ;;
  }

  #Hidden
  dimension: url {
    hidden: yes
    type: string
    sql: ${TABLE}.url ;;
  }
}
