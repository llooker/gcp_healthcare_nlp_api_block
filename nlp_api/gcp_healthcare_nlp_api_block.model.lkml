connection: "@{CONNECTION_NAME}"

include: "/**/*.view.lkml"          # include all views the project
include: "/**/*.dashboard.lookml"   # include LookML dashboards

persist_for: "24 hours"
label: "GCP Healthcare NLP API"


explore: clinical_notes_nlp_results {
  extends: [nlp_results_join_logic]
  label: "NLP Results - Patient Review"

  # JOINS in Encounter base view and Patient base view from the FHIR folder.
  # Full unnested joins defined in fhir -> fhir_unnested_explores, for reference.
  # Thie will extend the Explore to contain both unstructured & structured data.

  # join: encounter {
  #   view_label: Encounters
  #   type: left_outer
  #   sql_on: ${nlp_results.id} = ${encounter.part_of__encounter_id} ;;
  #   relationship: many_to_one
  # }
  # join: patient {
  #   view_label: Patients
  #   type: left_outer
  #   sql_on: ${nlp_results.id} = ${patient.id} ;;
  #   relationship: many_to_one
  # }
}


explore: nlp_results_terms {
  extends: [nlp_results_join_logic]
  label: "NLP Results - Term Review"
  always_filter: { filters:[nlp_results_terms.filter_on_original_term: "%cancer%"]}

  join: clinical_notes_nlp_results__entities {
    view_label: "(2) NLP Results - Entities" # overriding view label for this explore
  }

  join: clinical_notes_nlp_results {
    view_label: "(1) NLP Results - Overview"
    type: left_outer
    sql_on: ${nlp_results_terms.observation_id} = ${clinical_notes_nlp_results.id}  ;;
    relationship: one_to_many
  }
}


# this is the join logic used to unnest the clinical_notes_nlp_results nested fields
explore: nlp_results_join_logic {
  extension: required

  join: clinical_notes_nlp_results__entities {
    view_label: "(1) NLP Results - Overview"
    sql: LEFT JOIN UNNEST(${clinical_notes_nlp_results.entities}) as clinical_notes_nlp_results__entities ;;
    relationship: one_to_many
  }

  join: clinical_notes_nlp_results__entity_mentions {
    view_label: "(2) NLP Results - Entities"
    sql: LEFT JOIN UNNEST(${clinical_notes_nlp_results.entity_mentions}) as clinical_notes_nlp_results__entity_mentions ;;
    relationship: one_to_many
  }

  join: clinical_notes_nlp_results__relationships {
    view_label: "NLP Results - Relationships"
    sql: LEFT JOIN UNNEST(${clinical_notes_nlp_results.relationships}) as clinical_notes_nlp_results__relationships ;;
    relationship: one_to_many
  }

  join: clinical_notes_nlp_results__entities__vocabulary_codes {
    view_label: "NLP Results - Entities, Vocabulary Codes"
    sql: LEFT JOIN UNNEST(${clinical_notes_nlp_results__entities.vocabulary_codes}) as clinical_notes_nlp_results__entities__vocabulary_codes ;;
    relationship: one_to_many
  }

  join: clinical_notes_nlp_results__entity_mentions__linked_entities {
    view_label: "NLP Results - Entity Mentions, Linked Entities"
    sql: LEFT JOIN UNNEST(${clinical_notes_nlp_results__entity_mentions.linked_entities}) as clinical_notes_nlp_results__entity_mentions__linked_entities ;;
    relationship: one_to_many
  }

  join: nlp_results_vocab {
    view_label: "(2) NLP Results - Entities"
    type: left_outer
    relationship: one_to_many
    sql_on: ${nlp_results_vocab.entity_id} = ${clinical_notes_nlp_results__entity_mentions__linked_entities.entity_id} ;;
  }
}
