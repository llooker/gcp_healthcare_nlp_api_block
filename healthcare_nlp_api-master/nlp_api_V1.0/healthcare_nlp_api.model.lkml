connection: "looker-private-demo"

include: "/**/*.view.lkml"                # include all views the project
#include: "/**/*.dashboard.lookml"   # include LookML dashboards
include: "/nlp_api_V1.0/**/*.dashboard.lookml"

###### NLP Results Analysis ######
label: "Healthcare NLP API V1"

explore: nlp_results {
  label: "NLP Results"
  hidden: yes
  join: nlp_results__entity_mentions {
    view_label: "Entity Mentions"
    sql: LEFT JOIN UNNEST(${nlp_results.entity_mentions})
      as nlp_results__entity_mentions ;;
    relationship: one_to_many
  }
  join: nlp_results__entity_mentions__linked_entities {
    view_label: "Entity Mentions: Linked Entities"
    sql: LEFT JOIN UNNEST(${nlp_results__entity_mentions.linked_entities})
      as nlp_results__entity_mentions__linked_entities ;;
    relationship: one_to_many
  }
  join: nlp_results__entities {
    view_label: "Entity"
    type: left_outer
    relationship: one_to_many
    sql: ${nlp_results__entities.entity_id} = ${nlp_results__entity_mentions__linked_entities.entity_id} ;;
  }
}

explore: document_reference {
  label: "Document Reference"
  hidden: yes
  join: document_reference__subject {
    sql: LEFT JOIN UNNEST(${document_reference.subject})
      as document_reference__subject ;;
    relationship: one_to_many
  }
  join: document_reference__content {
    sql: LEFT JOIN UNNEST(${document_reference.content})
      as document_reference__content  ;;
    relationship: one_to_many
  }
  join: document_reference__content__attachment {
    sql: LEFT JOIN UNNEST(${document_reference__content.attachment})
      as document_reference__content__attachment  ;;
    relationship: one_to_many
  }
}

explore: patient {
  hidden: yes
  label: "Patients"
  join: patient__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${patient.address}) as patient_fop_fhir__address;;
  }
  join: patient__identifier {
    sql: LEFT JOIN UNNEST(${patient.identifier}) as patient_fop_fhir__identifier ;;
    relationship: one_to_many
  }
  join: patient__communication {
    sql: LEFT JOIN UNNEST(${patient.communication}) as patient_fop_fhir__communication ;;
    relationship: one_to_many
  }
  join: patient__meta__profile {
    sql: LEFT JOIN UNNEST(${patient.meta__profile}) as patient_fop_fhir__meta__profile ;;
    relationship: one_to_many
  }
}

explore: nlp_results_extended {
  hidden: no
  extends: [document_reference, patient]
  from: document_reference

  view_name: document_reference

  label: "Patients, Observations, and NLP Results"
  join: patient {
    relationship: many_to_one
    type: inner
    sql_on: ${document_reference__subject.patient_id} = ${patient.id} ;;
  }

  join: nlp_results {
    relationship: one_to_one
    type: inner
    sql_on: ${document_reference.id} = ${nlp_results.id}  ;;
  }

  join: nlp_results__entity_mentions {
    sql: LEFT JOIN UNNEST(${nlp_results.entity_mentions})
      as nlp_results__entity_mentions ;;
    relationship: one_to_many
  }

  join: nlp_results__entity_mentions__linked_entities {
    sql: LEFT JOIN UNNEST(${nlp_results__entity_mentions.linked_entities})
      as nlp_results__entity_mentions__linked_entities ;;
    relationship: one_to_many
  }

  join: nlp_results__entities {
    type: left_outer
    relationship: one_to_many
    sql_on: ${nlp_results__entities.entity_id} = ${nlp_results__entity_mentions__linked_entities.entity_id} ;;
  }

  join: nlp_results__entities__vocabulary_codes {
    type: left_outer
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${nlp_results__entities.vocabulary_codes_array})  AS entities_vocabulary_codes ;;
  }
}

explore: nlp_results__entities {}

######### Patient Journey #########
