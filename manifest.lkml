project_name: "gcp_healthcare_nlp_api_block"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
constant: CONNECTION_NAME {
  value: "looker-private-demo"
  export: override_optional
}

constant: NLP_RESULTS_SCOPED_TABLE_PATH {
  value: "looker-private-demo.healthcare_api_sandbox.kaggle_clinical_notes_nlp_results"
  export: override_optional
}

constant: ENCOUNTER_SCOPED_TABLE_PATH {
  value: "looker-private-demo.healthcare_api_sandbox.Encounter"
  export: override_optional
}

constant: PATIENT_SCOPED_TABLE_PATH {
  value: "looker-private-demo.healthcare_api_sandbox.Patient"
  export: override_optional
}
