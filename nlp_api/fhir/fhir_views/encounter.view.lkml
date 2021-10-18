# The name of this view in Looker is "Encounter"
view: encounter {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{ENCOUNTER_SCOPED_TABLE_PATH}`
    ;;
  drill_fields: [part_of__encounter_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: part_of__encounter_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.partOf.encounterId ;;
    group_label: "Part Of"
    group_item_label: "Encounter ID"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: account {
    hidden: yes
    sql: ${TABLE}.account ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Appointment" in Explore.

  dimension: appointment {
    hidden: yes
    sql: ${TABLE}.appointment ;;
  }

  dimension: based_on {
    hidden: yes
    sql: ${TABLE}.basedOn ;;
  }

  dimension: class__code {
    type: string
    sql: ${TABLE}.class.code ;;
    group_label: "Class"
    group_item_label: "Code"
  }

  dimension: class__display {
    type: string
    sql: ${TABLE}.class.display ;;
    group_label: "Class"
    group_item_label: "Display"
  }

  dimension: class__system {
    type: string
    sql: ${TABLE}.class.system ;;
    group_label: "Class"
    group_item_label: "System"
  }

  dimension: class__user_selected {
    type: yesno
    sql: ${TABLE}.class.userSelected ;;
    group_label: "Class"
    group_item_label: "User Selected"
  }

  dimension: class__version {
    type: string
    sql: ${TABLE}.class.version ;;
    group_label: "Class"
    group_item_label: "Version"
  }

  dimension: class_history {
    hidden: yes
    sql: ${TABLE}.classHistory ;;
  }

  dimension: diagnosis {
    hidden: yes
    sql: ${TABLE}.diagnosis ;;
  }

  dimension: episode_of_care {
    hidden: yes
    sql: ${TABLE}.episodeOfCare ;;
  }

  dimension: hospitalization__admit_source__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.admitSource.coding ;;
    group_label: "Hospitalization Admit Source"
    group_item_label: "Coding"
  }

  dimension: hospitalization__admit_source__text {
    type: string
    sql: ${TABLE}.hospitalization.admitSource.text ;;
    group_label: "Hospitalization Admit Source"
    group_item_label: "Text"
  }

  dimension: hospitalization__destination__display {
    type: string
    sql: ${TABLE}.hospitalization.destination.display ;;
    group_label: "Hospitalization Destination"
    group_item_label: "Display"
  }

  dimension: hospitalization__destination__identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.display ;;
    group_label: "Hospitalization Destination Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.assigner.display ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.assigner.type ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.period.`end` ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.period.start ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.system ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.type.coding ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.type.text ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.use ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__destination__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.identifier.value ;;
    group_label: "Hospitalization Destination Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__destination__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.organizationId ;;
    group_label: "Hospitalization Destination Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__destination__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.reference ;;
    group_label: "Hospitalization Destination Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__destination__identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.assigner.type ;;
    group_label: "Hospitalization Destination Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__destination__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.period.`end` ;;
    group_label: "Hospitalization Destination Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__destination__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.period.start ;;
    group_label: "Hospitalization Destination Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__destination__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.system ;;
    group_label: "Hospitalization Destination Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__destination__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.destination.identifier.type.coding ;;
    group_label: "Hospitalization Destination Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__destination__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.type.text ;;
    group_label: "Hospitalization Destination Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__destination__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.use ;;
    group_label: "Hospitalization Destination Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__destination__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.destination.identifier.value ;;
    group_label: "Hospitalization Destination Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__destination__location_id {
    type: string
    sql: ${TABLE}.hospitalization.destination.locationId ;;
    group_label: "Hospitalization Destination"
    group_item_label: "Location ID"
  }

  dimension: hospitalization__destination__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.destination.organizationId ;;
    group_label: "Hospitalization Destination"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__destination__reference {
    type: string
    sql: ${TABLE}.hospitalization.destination.reference ;;
    group_label: "Hospitalization Destination"
    group_item_label: "Reference"
  }

  dimension: hospitalization__destination__type {
    type: string
    sql: ${TABLE}.hospitalization.destination.type ;;
    group_label: "Hospitalization Destination"
    group_item_label: "Type"
  }

  dimension: hospitalization__diet_preference {
    hidden: yes
    sql: ${TABLE}.hospitalization.dietPreference ;;
    group_label: "Hospitalization"
    group_item_label: "Diet Preference"
  }

  dimension: hospitalization__discharge_disposition__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.dischargeDisposition.coding ;;
    group_label: "Hospitalization Discharge Disposition"
    group_item_label: "Coding"
  }

  dimension: hospitalization__discharge_disposition__text {
    type: string
    sql: ${TABLE}.hospitalization.dischargeDisposition.text ;;
    group_label: "Hospitalization Discharge Disposition"
    group_item_label: "Text"
  }

  dimension: hospitalization__origin__display {
    type: string
    sql: ${TABLE}.hospitalization.origin.display ;;
    group_label: "Hospitalization Origin"
    group_item_label: "Display"
  }

  dimension: hospitalization__origin__identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.display ;;
    group_label: "Hospitalization Origin Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.assigner.display ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.assigner.type ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.period.`end` ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.period.start ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.system ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.type.coding ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.type.text ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.use ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__origin__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.identifier.value ;;
    group_label: "Hospitalization Origin Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__origin__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.organizationId ;;
    group_label: "Hospitalization Origin Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__origin__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.reference ;;
    group_label: "Hospitalization Origin Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__origin__identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.assigner.type ;;
    group_label: "Hospitalization Origin Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__origin__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.period.`end` ;;
    group_label: "Hospitalization Origin Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__origin__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.period.start ;;
    group_label: "Hospitalization Origin Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__origin__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.system ;;
    group_label: "Hospitalization Origin Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__origin__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.origin.identifier.type.coding ;;
    group_label: "Hospitalization Origin Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__origin__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.type.text ;;
    group_label: "Hospitalization Origin Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__origin__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.use ;;
    group_label: "Hospitalization Origin Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__origin__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.origin.identifier.value ;;
    group_label: "Hospitalization Origin Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__origin__location_id {
    type: string
    sql: ${TABLE}.hospitalization.origin.locationId ;;
    group_label: "Hospitalization Origin"
    group_item_label: "Location ID"
  }

  dimension: hospitalization__origin__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.origin.organizationId ;;
    group_label: "Hospitalization Origin"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__origin__reference {
    type: string
    sql: ${TABLE}.hospitalization.origin.reference ;;
    group_label: "Hospitalization Origin"
    group_item_label: "Reference"
  }

  dimension: hospitalization__origin__type {
    type: string
    sql: ${TABLE}.hospitalization.origin.type ;;
    group_label: "Hospitalization Origin"
    group_item_label: "Type"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.display ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.display ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.period.`end` ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.period.start ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.system ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.type.coding ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.type.text ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.use ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.identifier.value ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.reference ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.assigner.type ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.period.`end` ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.period.start ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.system ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.type.coding ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.type.text ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.use ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.identifier.value ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.organizationId ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__reference {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.reference ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: hospitalization__pre_admission_identifier__assigner__type {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.assigner.type ;;
    group_label: "Hospitalization Pre Admission Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: hospitalization__pre_admission_identifier__period__end {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.period.`end` ;;
    group_label: "Hospitalization Pre Admission Identifier Period"
    group_item_label: "End"
  }

  dimension: hospitalization__pre_admission_identifier__period__start {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.period.start ;;
    group_label: "Hospitalization Pre Admission Identifier Period"
    group_item_label: "Start"
  }

  dimension: hospitalization__pre_admission_identifier__system {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.system ;;
    group_label: "Hospitalization Pre Admission Identifier"
    group_item_label: "System"
  }

  dimension: hospitalization__pre_admission_identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.type.coding ;;
    group_label: "Hospitalization Pre Admission Identifier Type"
    group_item_label: "Coding"
  }

  dimension: hospitalization__pre_admission_identifier__type__text {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.type.text ;;
    group_label: "Hospitalization Pre Admission Identifier Type"
    group_item_label: "Text"
  }

  dimension: hospitalization__pre_admission_identifier__use {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.use ;;
    group_label: "Hospitalization Pre Admission Identifier"
    group_item_label: "Use"
  }

  dimension: hospitalization__pre_admission_identifier__value {
    type: string
    sql: ${TABLE}.hospitalization.preAdmissionIdentifier.value ;;
    group_label: "Hospitalization Pre Admission Identifier"
    group_item_label: "Value"
  }

  dimension: hospitalization__re_admission__coding {
    hidden: yes
    sql: ${TABLE}.hospitalization.reAdmission.coding ;;
    group_label: "Hospitalization Re Admission"
    group_item_label: "Coding"
  }

  dimension: hospitalization__re_admission__text {
    type: string
    sql: ${TABLE}.hospitalization.reAdmission.text ;;
    group_label: "Hospitalization Re Admission"
    group_item_label: "Text"
  }

  dimension: hospitalization__special_arrangement {
    hidden: yes
    sql: ${TABLE}.hospitalization.specialArrangement ;;
    group_label: "Hospitalization"
    group_item_label: "Special Arrangement"
  }

  dimension: hospitalization__special_courtesy {
    hidden: yes
    sql: ${TABLE}.hospitalization.specialCourtesy ;;
    group_label: "Hospitalization"
    group_item_label: "Special Courtesy"
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  dimension: implicit_rules {
    type: string
    sql: ${TABLE}.implicitRules ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: length__code {
    type: string
    sql: ${TABLE}.length.code ;;
    group_label: "Length"
    group_item_label: "Code"
  }

  dimension: length__comparator {
    type: string
    sql: ${TABLE}.length.comparator ;;
    group_label: "Length"
    group_item_label: "Comparator"
  }

  dimension: length__system {
    type: string
    sql: ${TABLE}.length.system ;;
    group_label: "Length"
    group_item_label: "System"
  }

  dimension: length__unit {
    type: string
    sql: ${TABLE}.length.unit ;;
    group_label: "Length"
    group_item_label: "Unit"
  }

  dimension: length__value {
    type: number
    sql: ${TABLE}.length.value ;;
    group_label: "Length"
    group_item_label: "Value"
  }

  dimension: location {
    hidden: yes
    sql: ${TABLE}.location ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: meta__last_updated {
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
    sql: ${TABLE}.meta.lastUpdated ;;
    group_label: "Meta"
    group_item_label: "Last Updated"
  }

  dimension: meta__profile {
    hidden: yes
    sql: ${TABLE}.meta.profile ;;
    group_label: "Meta"
    group_item_label: "Profile"
  }

  dimension: meta__security {
    hidden: yes
    sql: ${TABLE}.meta.security ;;
    group_label: "Meta"
    group_item_label: "Security"
  }

  dimension: meta__source {
    type: string
    sql: ${TABLE}.meta.source ;;
    group_label: "Meta"
    group_item_label: "Source"
  }

  dimension: meta__tag {
    hidden: yes
    sql: ${TABLE}.meta.tag ;;
    group_label: "Meta"
    group_item_label: "Tag"
  }

  dimension: meta__version_id {
    type: string
    sql: ${TABLE}.meta.versionId ;;
    group_label: "Meta"
    group_item_label: "Version ID"
  }

  dimension: part_of__display {
    type: string
    sql: ${TABLE}.partOf.display ;;
    group_label: "Part Of"
    group_item_label: "Display"
  }

  dimension: part_of__identifier__assigner__display {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.display ;;
    group_label: "Part of Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: part_of__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.assigner.display ;;
    group_label: "Part of Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: part_of__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Part of Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: part_of__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Part of Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: part_of__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.assigner.type ;;
    group_label: "Part of Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: part_of__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.period.`end` ;;
    group_label: "Part of Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: part_of__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.period.start ;;
    group_label: "Part of Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: part_of__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.system ;;
    group_label: "Part of Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: part_of__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.partOf.identifier.assigner.identifier.type.coding ;;
    group_label: "Part of Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: part_of__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.type.text ;;
    group_label: "Part of Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: part_of__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.use ;;
    group_label: "Part of Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: part_of__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.identifier.value ;;
    group_label: "Part of Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: part_of__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.organizationId ;;
    group_label: "Part of Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: part_of__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.reference ;;
    group_label: "Part of Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: part_of__identifier__assigner__type {
    type: string
    sql: ${TABLE}.partOf.identifier.assigner.type ;;
    group_label: "Part of Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: part_of__identifier__period__end {
    type: string
    sql: ${TABLE}.partOf.identifier.period.`end` ;;
    group_label: "Part of Identifier Period"
    group_item_label: "End"
  }

  dimension: part_of__identifier__period__start {
    type: string
    sql: ${TABLE}.partOf.identifier.period.start ;;
    group_label: "Part of Identifier Period"
    group_item_label: "Start"
  }

  dimension: part_of__identifier__system {
    type: string
    sql: ${TABLE}.partOf.identifier.system ;;
    group_label: "Part of Identifier"
    group_item_label: "System"
  }

  dimension: part_of__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.partOf.identifier.type.coding ;;
    group_label: "Part of Identifier Type"
    group_item_label: "Coding"
  }

  dimension: part_of__identifier__type__text {
    type: string
    sql: ${TABLE}.partOf.identifier.type.text ;;
    group_label: "Part of Identifier Type"
    group_item_label: "Text"
  }

  dimension: part_of__identifier__use {
    type: string
    sql: ${TABLE}.partOf.identifier.use ;;
    group_label: "Part of Identifier"
    group_item_label: "Use"
  }

  dimension: part_of__identifier__value {
    type: string
    sql: ${TABLE}.partOf.identifier.value ;;
    group_label: "Part of Identifier"
    group_item_label: "Value"
  }

  dimension: part_of__reference {
    type: string
    sql: ${TABLE}.partOf.reference ;;
    group_label: "Part Of"
    group_item_label: "Reference"
  }

  dimension: part_of__type {
    type: string
    sql: ${TABLE}.partOf.type ;;
    group_label: "Part Of"
    group_item_label: "Type"
  }

  dimension: participant {
    hidden: yes
    sql: ${TABLE}.participant ;;
  }

  dimension: participant__type {
    hidden: yes
    sql: ${TABLE}.participant.type ;;
    group_label: "Participant"
    group_item_label: "Type"
  }

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }

  dimension: priority__coding {
    hidden: yes
    sql: ${TABLE}.priority.coding ;;
    group_label: "Priority"
    group_item_label: "Coding"
  }

  dimension: priority__text {
    type: string
    sql: ${TABLE}.priority.text ;;
    group_label: "Priority"
    group_item_label: "Text"
  }

  dimension: reason_code {
    hidden: yes
    sql: ${TABLE}.reasonCode ;;
  }

  dimension: reason_reference {
    hidden: yes
    sql: ${TABLE}.reasonReference ;;
  }

  dimension: service_provider__display {
    type: string
    sql: ${TABLE}.serviceProvider.display ;;
    group_label: "Service Provider"
    group_item_label: "Display"
  }

  dimension: service_provider__identifier__assigner__display {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.display ;;
    group_label: "Service Provider Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: service_provider__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.assigner.display ;;
    group_label: "Service Provider Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: service_provider__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Service Provider Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: service_provider__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Service Provider Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: service_provider__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.assigner.type ;;
    group_label: "Service Provider Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: service_provider__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.period.`end` ;;
    group_label: "Service Provider Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: service_provider__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.period.start ;;
    group_label: "Service Provider Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: service_provider__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.system ;;
    group_label: "Service Provider Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: service_provider__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.type.coding ;;
    group_label: "Service Provider Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: service_provider__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.type.text ;;
    group_label: "Service Provider Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: service_provider__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.use ;;
    group_label: "Service Provider Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: service_provider__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.identifier.value ;;
    group_label: "Service Provider Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: service_provider__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.organizationId ;;
    group_label: "Service Provider Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: service_provider__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.reference ;;
    group_label: "Service Provider Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: service_provider__identifier__assigner__type {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.assigner.type ;;
    group_label: "Service Provider Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: service_provider__identifier__period__end {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.period.`end` ;;
    group_label: "Service Provider Identifier Period"
    group_item_label: "End"
  }

  dimension: service_provider__identifier__period__start {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.period.start ;;
    group_label: "Service Provider Identifier Period"
    group_item_label: "Start"
  }

  dimension: service_provider__identifier__system {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.system ;;
    group_label: "Service Provider Identifier"
    group_item_label: "System"
  }

  dimension: service_provider__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.serviceProvider.identifier.type.coding ;;
    group_label: "Service Provider Identifier Type"
    group_item_label: "Coding"
  }

  dimension: service_provider__identifier__type__text {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.type.text ;;
    group_label: "Service Provider Identifier Type"
    group_item_label: "Text"
  }

  dimension: service_provider__identifier__use {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.use ;;
    group_label: "Service Provider Identifier"
    group_item_label: "Use"
  }

  dimension: service_provider__identifier__value {
    type: string
    sql: ${TABLE}.serviceProvider.identifier.value ;;
    group_label: "Service Provider Identifier"
    group_item_label: "Value"
  }

  dimension: service_provider__organization_id {
    type: string
    sql: ${TABLE}.serviceProvider.organizationId ;;
    group_label: "Service Provider"
    group_item_label: "Organization ID"
  }

  dimension: service_provider__reference {
    type: string
    sql: ${TABLE}.serviceProvider.reference ;;
    group_label: "Service Provider"
    group_item_label: "Reference"
  }

  dimension: service_provider__type {
    type: string
    sql: ${TABLE}.serviceProvider.type ;;
    group_label: "Service Provider"
    group_item_label: "Type"
  }

  dimension: service_type__coding {
    hidden: yes
    sql: ${TABLE}.serviceType.coding ;;
    group_label: "Service Type"
    group_item_label: "Coding"
  }

  dimension: service_type__text {
    type: string
    sql: ${TABLE}.serviceType.text ;;
    group_label: "Service Type"
    group_item_label: "Text"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_history {
    hidden: yes
    sql: ${TABLE}.statusHistory ;;
  }

  dimension: subject__display {
    type: string
    sql: ${TABLE}.subject.display ;;
    group_label: "Subject"
    group_item_label: "Display"
  }

  dimension: subject__group_id {
    type: string
    sql: ${TABLE}.subject.groupId ;;
    group_label: "Subject"
    group_item_label: "Group ID"
  }

  dimension: subject__identifier__assigner__display {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.display ;;
    group_label: "Subject Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: subject__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.assigner.display ;;
    group_label: "Subject Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: subject__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Subject Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: subject__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Subject Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: subject__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.assigner.type ;;
    group_label: "Subject Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: subject__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.period.`end` ;;
    group_label: "Subject Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: subject__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.period.start ;;
    group_label: "Subject Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: subject__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.system ;;
    group_label: "Subject Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: subject__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.subject.identifier.assigner.identifier.type.coding ;;
    group_label: "Subject Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: subject__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.type.text ;;
    group_label: "Subject Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: subject__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.use ;;
    group_label: "Subject Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: subject__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.identifier.value ;;
    group_label: "Subject Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: subject__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.organizationId ;;
    group_label: "Subject Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: subject__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.reference ;;
    group_label: "Subject Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: subject__identifier__assigner__type {
    type: string
    sql: ${TABLE}.subject.identifier.assigner.type ;;
    group_label: "Subject Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: subject__identifier__period__end {
    type: string
    sql: ${TABLE}.subject.identifier.period.`end` ;;
    group_label: "Subject Identifier Period"
    group_item_label: "End"
  }

  dimension: subject__identifier__period__start {
    type: string
    sql: ${TABLE}.subject.identifier.period.start ;;
    group_label: "Subject Identifier Period"
    group_item_label: "Start"
  }

  dimension: subject__identifier__system {
    type: string
    sql: ${TABLE}.subject.identifier.system ;;
    group_label: "Subject Identifier"
    group_item_label: "System"
  }

  dimension: subject__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.subject.identifier.type.coding ;;
    group_label: "Subject Identifier Type"
    group_item_label: "Coding"
  }

  dimension: subject__identifier__type__text {
    type: string
    sql: ${TABLE}.subject.identifier.type.text ;;
    group_label: "Subject Identifier Type"
    group_item_label: "Text"
  }

  dimension: subject__identifier__use {
    type: string
    sql: ${TABLE}.subject.identifier.use ;;
    group_label: "Subject Identifier"
    group_item_label: "Use"
  }

  dimension: subject__identifier__value {
    type: string
    sql: ${TABLE}.subject.identifier.value ;;
    group_label: "Subject Identifier"
    group_item_label: "Value"
  }

  dimension: subject__patient_id {
    type: string
    sql: ${TABLE}.subject.patientId ;;
    group_label: "Subject"
    group_item_label: "Patient ID"
  }

  dimension: subject__reference {
    type: string
    sql: ${TABLE}.subject.reference ;;
    group_label: "Subject"
    group_item_label: "Reference"
  }

  dimension: subject__type {
    type: string
    sql: ${TABLE}.subject.type ;;
    group_label: "Subject"
    group_item_label: "Type"
  }

  dimension: text__div {
    type: string
    sql: ${TABLE}.text.div ;;
    group_label: "Text"
    group_item_label: "Div"
  }

  dimension: text__status {
    type: string
    sql: ${TABLE}.text.status ;;
    group_label: "Text"
    group_item_label: "Status"
  }

  dimension: type {
    hidden: yes
    sql: ${TABLE}.type ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [part_of__encounter_id]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_length__value {
    type: sum
    hidden: yes
    sql: ${length__value} ;;
  }

  measure: average_length__value {
    type: average
    hidden: yes
    sql: ${length__value} ;;
  }
}

# The name of this view in Looker is "Encounter Type"
view: encounter__type {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Based On"
view: encounter__based_on {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Display" in Explore.

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.display ;;
    group_label: "Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.display ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.type ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.`end` ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.start ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.system ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.assigner.identifier.type.coding ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.type.text ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.use ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.value ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.reference ;;
    group_label: "Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.type ;;
    group_label: "Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.period.`end` ;;
    group_label: "Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.period.start ;;
    group_label: "Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__system {
    type: string
    sql: ${TABLE}.identifier.system ;;
    group_label: "Identifier"
    group_item_label: "System"
  }

  dimension: identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.type.coding ;;
    group_label: "Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.type.text ;;
    group_label: "Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__use {
    type: string
    sql: ${TABLE}.identifier.use ;;
    group_label: "Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__value {
    type: string
    sql: ${TABLE}.identifier.value ;;
    group_label: "Identifier"
    group_item_label: "Value"
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: service_request_id {
    type: string
    sql: ${TABLE}.serviceRequestId ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Encounter Meta Profile"
view: encounter__meta__profile {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Encounter Meta Profile" in Explore.

  dimension: encounter__meta__profile {
    type: string
    sql: encounter__meta__profile ;;
  }
}

# The name of this view in Looker is "Encounter Account"
view: encounter__account {
  drill_fields: [account_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.accountId ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Display" in Explore.

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.display ;;
    group_label: "Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.display ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.type ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.`end` ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.start ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.system ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.assigner.identifier.type.coding ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.type.text ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.use ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.value ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.reference ;;
    group_label: "Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.type ;;
    group_label: "Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.period.`end` ;;
    group_label: "Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.period.start ;;
    group_label: "Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__system {
    type: string
    sql: ${TABLE}.identifier.system ;;
    group_label: "Identifier"
    group_item_label: "System"
  }

  dimension: identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.type.coding ;;
    group_label: "Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.type.text ;;
    group_label: "Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__use {
    type: string
    sql: ${TABLE}.identifier.use ;;
    group_label: "Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__value {
    type: string
    sql: ${TABLE}.identifier.value ;;
    group_label: "Identifier"
    group_item_label: "Value"
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Encounter Meta Tag"
view: encounter__meta__tag {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Identifier"
view: encounter__identifier {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigner Display" in Explore.

  dimension: assigner__display {
    type: string
    sql: ${TABLE}.assigner.display ;;
    group_label: "Assigner"
    group_item_label: "Display"
  }

  dimension: assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.assigner.identifier.assigner.display ;;
    group_label: "Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.assigner.identifier.assigner.organizationId ;;
    group_label: "Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.assigner.identifier.assigner.reference ;;
    group_label: "Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.assigner.identifier.assigner.type ;;
    group_label: "Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.assigner.identifier.period.`end` ;;
    group_label: "Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.assigner.identifier.period.start ;;
    group_label: "Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: assigner__identifier__system {
    type: string
    sql: ${TABLE}.assigner.identifier.system ;;
    group_label: "Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.assigner.identifier.type.coding ;;
    group_label: "Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.assigner.identifier.type.text ;;
    group_label: "Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: assigner__identifier__use {
    type: string
    sql: ${TABLE}.assigner.identifier.use ;;
    group_label: "Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: assigner__identifier__value {
    type: string
    sql: ${TABLE}.assigner.identifier.value ;;
    group_label: "Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: assigner__organization_id {
    type: string
    sql: ${TABLE}.assigner.organizationId ;;
    group_label: "Assigner"
    group_item_label: "Organization ID"
  }

  dimension: assigner__reference {
    type: string
    sql: ${TABLE}.assigner.reference ;;
    group_label: "Assigner"
    group_item_label: "Reference"
  }

  dimension: assigner__type {
    type: string
    sql: ${TABLE}.assigner.type ;;
    group_label: "Assigner"
    group_item_label: "Type"
  }

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: type__coding {
    hidden: yes
    sql: ${TABLE}.type.coding ;;
    group_label: "Type"
    group_item_label: "Coding"
  }

  dimension: type__text {
    type: string
    sql: ${TABLE}.type.text ;;
    group_label: "Type"
    group_item_label: "Text"
  }

  dimension: use {
    type: string
    sql: ${TABLE}.use ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

# The name of this view in Looker is "Encounter Diagnosis"
view: encounter__diagnosis {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition Condition ID" in Explore.

  dimension: condition__condition_id {
    type: string
    sql: ${TABLE}.condition.conditionId ;;
    group_label: "Condition"
    group_item_label: "Condition ID"
  }

  dimension: condition__display {
    type: string
    sql: ${TABLE}.condition.display ;;
    group_label: "Condition"
    group_item_label: "Display"
  }

  dimension: condition__identifier__assigner__display {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.display ;;
    group_label: "Condition Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: condition__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.assigner.display ;;
    group_label: "Condition Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: condition__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Condition Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: condition__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Condition Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: condition__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.assigner.type ;;
    group_label: "Condition Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: condition__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.period.`end` ;;
    group_label: "Condition Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: condition__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.period.start ;;
    group_label: "Condition Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: condition__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.system ;;
    group_label: "Condition Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: condition__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.condition.identifier.assigner.identifier.type.coding ;;
    group_label: "Condition Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: condition__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.type.text ;;
    group_label: "Condition Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: condition__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.use ;;
    group_label: "Condition Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: condition__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.identifier.value ;;
    group_label: "Condition Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: condition__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.organizationId ;;
    group_label: "Condition Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: condition__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.reference ;;
    group_label: "Condition Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: condition__identifier__assigner__type {
    type: string
    sql: ${TABLE}.condition.identifier.assigner.type ;;
    group_label: "Condition Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: condition__identifier__period__end {
    type: string
    sql: ${TABLE}.condition.identifier.period.`end` ;;
    group_label: "Condition Identifier Period"
    group_item_label: "End"
  }

  dimension: condition__identifier__period__start {
    type: string
    sql: ${TABLE}.condition.identifier.period.start ;;
    group_label: "Condition Identifier Period"
    group_item_label: "Start"
  }

  dimension: condition__identifier__system {
    type: string
    sql: ${TABLE}.condition.identifier.system ;;
    group_label: "Condition Identifier"
    group_item_label: "System"
  }

  dimension: condition__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.condition.identifier.type.coding ;;
    group_label: "Condition Identifier Type"
    group_item_label: "Coding"
  }

  dimension: condition__identifier__type__text {
    type: string
    sql: ${TABLE}.condition.identifier.type.text ;;
    group_label: "Condition Identifier Type"
    group_item_label: "Text"
  }

  dimension: condition__identifier__use {
    type: string
    sql: ${TABLE}.condition.identifier.use ;;
    group_label: "Condition Identifier"
    group_item_label: "Use"
  }

  dimension: condition__identifier__value {
    type: string
    sql: ${TABLE}.condition.identifier.value ;;
    group_label: "Condition Identifier"
    group_item_label: "Value"
  }

  dimension: condition__procedure_id {
    type: string
    sql: ${TABLE}.condition.procedureId ;;
    group_label: "Condition"
    group_item_label: "Procedure ID"
  }

  dimension: condition__reference {
    type: string
    sql: ${TABLE}.condition.reference ;;
    group_label: "Condition"
    group_item_label: "Reference"
  }

  dimension: condition__type {
    type: string
    sql: ${TABLE}.condition.type ;;
    group_label: "Condition"
    group_item_label: "Type"
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: use__coding {
    hidden: yes
    sql: ${TABLE}.use.coding ;;
    group_label: "Use"
    group_item_label: "Coding"
  }

  dimension: use__text {
    type: string
    sql: ${TABLE}.use.text ;;
    group_label: "Use"
    group_item_label: "Text"
  }
}

# The name of this view in Looker is "Encounter Reason Code"
view: encounter__reason_code {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Location"
view: encounter__location {
  drill_fields: [location__location_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: location__location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location.locationId ;;
    group_label: "Location"
    group_item_label: "Location ID"
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Location Display" in Explore.

  dimension: location__display {
    type: string
    sql: ${TABLE}.location.display ;;
    group_label: "Location"
    group_item_label: "Display"
  }

  dimension: location__identifier__assigner__display {
    type: string
    sql: ${TABLE}.location.identifier.assigner.display ;;
    group_label: "Location Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: location__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.assigner.display ;;
    group_label: "Location Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: location__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Location Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: location__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Location Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: location__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.assigner.type ;;
    group_label: "Location Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: location__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.period.`end` ;;
    group_label: "Location Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: location__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.period.start ;;
    group_label: "Location Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: location__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.system ;;
    group_label: "Location Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: location__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.location.identifier.assigner.identifier.type.coding ;;
    group_label: "Location Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: location__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.type.text ;;
    group_label: "Location Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: location__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.use ;;
    group_label: "Location Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: location__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.location.identifier.assigner.identifier.value ;;
    group_label: "Location Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: location__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.location.identifier.assigner.organizationId ;;
    group_label: "Location Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: location__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.location.identifier.assigner.reference ;;
    group_label: "Location Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: location__identifier__assigner__type {
    type: string
    sql: ${TABLE}.location.identifier.assigner.type ;;
    group_label: "Location Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: location__identifier__period__end {
    type: string
    sql: ${TABLE}.location.identifier.period.`end` ;;
    group_label: "Location Identifier Period"
    group_item_label: "End"
  }

  dimension: location__identifier__period__start {
    type: string
    sql: ${TABLE}.location.identifier.period.start ;;
    group_label: "Location Identifier Period"
    group_item_label: "Start"
  }

  dimension: location__identifier__system {
    type: string
    sql: ${TABLE}.location.identifier.system ;;
    group_label: "Location Identifier"
    group_item_label: "System"
  }

  dimension: location__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.location.identifier.type.coding ;;
    group_label: "Location Identifier Type"
    group_item_label: "Coding"
  }

  dimension: location__identifier__type__text {
    type: string
    sql: ${TABLE}.location.identifier.type.text ;;
    group_label: "Location Identifier Type"
    group_item_label: "Text"
  }

  dimension: location__identifier__use {
    type: string
    sql: ${TABLE}.location.identifier.use ;;
    group_label: "Location Identifier"
    group_item_label: "Use"
  }

  dimension: location__identifier__value {
    type: string
    sql: ${TABLE}.location.identifier.value ;;
    group_label: "Location Identifier"
    group_item_label: "Value"
  }

  dimension: location__reference {
    type: string
    sql: ${TABLE}.location.reference ;;
    group_label: "Location"
    group_item_label: "Reference"
  }

  dimension: location__type {
    type: string
    sql: ${TABLE}.location.type ;;
    group_label: "Location"
    group_item_label: "Type"
  }

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }

  dimension: physical_type__coding {
    hidden: yes
    sql: ${TABLE}.physicalType.coding ;;
    group_label: "Physical Type"
    group_item_label: "Coding"
  }

  dimension: physical_type__text {
    type: string
    sql: ${TABLE}.physicalType.text ;;
    group_label: "Physical Type"
    group_item_label: "Text"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
}

# The name of this view in Looker is "Encounter Appointment"
view: encounter__appointment {
  drill_fields: [appointment_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: appointment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.appointmentId ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Display" in Explore.

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.display ;;
    group_label: "Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.display ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.type ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.`end` ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.start ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.system ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.assigner.identifier.type.coding ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.type.text ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.use ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.value ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.reference ;;
    group_label: "Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.type ;;
    group_label: "Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.period.`end` ;;
    group_label: "Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.period.start ;;
    group_label: "Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__system {
    type: string
    sql: ${TABLE}.identifier.system ;;
    group_label: "Identifier"
    group_item_label: "System"
  }

  dimension: identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.type.coding ;;
    group_label: "Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.type.text ;;
    group_label: "Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__use {
    type: string
    sql: ${TABLE}.identifier.use ;;
    group_label: "Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__value {
    type: string
    sql: ${TABLE}.identifier.value ;;
    group_label: "Identifier"
    group_item_label: "Value"
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Encounter Type Coding"
view: encounter__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Episode of Care"
view: encounter__episode_of_care {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Display" in Explore.

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: episode_of_care_id {
    type: string
    sql: ${TABLE}.episodeOfCareId ;;
  }

  dimension: identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.display ;;
    group_label: "Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.display ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.type ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.`end` ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.start ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.system ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.assigner.identifier.type.coding ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.type.text ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.use ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.value ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.reference ;;
    group_label: "Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.type ;;
    group_label: "Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.period.`end` ;;
    group_label: "Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.period.start ;;
    group_label: "Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__system {
    type: string
    sql: ${TABLE}.identifier.system ;;
    group_label: "Identifier"
    group_item_label: "System"
  }

  dimension: identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.type.coding ;;
    group_label: "Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.type.text ;;
    group_label: "Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__use {
    type: string
    sql: ${TABLE}.identifier.use ;;
    group_label: "Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__value {
    type: string
    sql: ${TABLE}.identifier.value ;;
    group_label: "Identifier"
    group_item_label: "Value"
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Encounter Meta Security"
view: encounter__meta__security {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Reason Reference"
view: encounter__reason_reference {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition ID" in Explore.

  dimension: condition_id {
    type: string
    sql: ${TABLE}.conditionId ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.display ;;
    group_label: "Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.display ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.assigner.type ;;
    group_label: "Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.`end` ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.period.start ;;
    group_label: "Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.system ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.assigner.identifier.type.coding ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.type.text ;;
    group_label: "Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.use ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.identifier.assigner.identifier.value ;;
    group_label: "Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.identifier.assigner.organizationId ;;
    group_label: "Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: identifier__assigner__reference {
    type: string
    sql: ${TABLE}.identifier.assigner.reference ;;
    group_label: "Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: identifier__assigner__type {
    type: string
    sql: ${TABLE}.identifier.assigner.type ;;
    group_label: "Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: identifier__period__end {
    type: string
    sql: ${TABLE}.identifier.period.`end` ;;
    group_label: "Identifier Period"
    group_item_label: "End"
  }

  dimension: identifier__period__start {
    type: string
    sql: ${TABLE}.identifier.period.start ;;
    group_label: "Identifier Period"
    group_item_label: "Start"
  }

  dimension: identifier__system {
    type: string
    sql: ${TABLE}.identifier.system ;;
    group_label: "Identifier"
    group_item_label: "System"
  }

  dimension: identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.identifier.type.coding ;;
    group_label: "Identifier Type"
    group_item_label: "Coding"
  }

  dimension: identifier__type__text {
    type: string
    sql: ${TABLE}.identifier.type.text ;;
    group_label: "Identifier Type"
    group_item_label: "Text"
  }

  dimension: identifier__use {
    type: string
    sql: ${TABLE}.identifier.use ;;
    group_label: "Identifier"
    group_item_label: "Use"
  }

  dimension: identifier__value {
    type: string
    sql: ${TABLE}.identifier.value ;;
    group_label: "Identifier"
    group_item_label: "Value"
  }

  dimension: immunization_recommendation_id {
    type: string
    sql: ${TABLE}.immunizationRecommendationId ;;
  }

  dimension: observation_id {
    type: string
    sql: ${TABLE}.observationId ;;
  }

  dimension: procedure_id {
    type: string
    sql: ${TABLE}.procedureId ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Encounter Priority Coding"
view: encounter__priority__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Status History"
view: encounter__status_history {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Period End" in Explore.

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
}

# The name of this view in Looker is "Encounter Participant Type"
view: encounter__participant__type {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Reason Code Coding"
view: encounter__reason_code__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Service Type Coding"
view: encounter__service_type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Class History"
view: encounter__class_history {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Class Code" in Explore.

  dimension: class__code {
    type: string
    sql: ${TABLE}.class.code ;;
    group_label: "Class"
    group_item_label: "Code"
  }

  dimension: class__display {
    type: string
    sql: ${TABLE}.class.display ;;
    group_label: "Class"
    group_item_label: "Display"
  }

  dimension: class__system {
    type: string
    sql: ${TABLE}.class.system ;;
    group_label: "Class"
    group_item_label: "System"
  }

  dimension: class__user_selected {
    type: yesno
    sql: ${TABLE}.class.userSelected ;;
    group_label: "Class"
    group_item_label: "User Selected"
  }

  dimension: class__version {
    type: string
    sql: ${TABLE}.class.version ;;
    group_label: "Class"
    group_item_label: "Version"
  }

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }
}

# The name of this view in Looker is "Encounter Participant"
view: encounter__participant {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Individual Display" in Explore.

  dimension: individual__display {
    type: string
    sql: ${TABLE}.individual.display ;;
    group_label: "Individual"
    group_item_label: "Display"
  }

  dimension: individual__identifier__assigner__display {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.display ;;
    group_label: "Individual Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: individual__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.assigner.display ;;
    group_label: "Individual Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: individual__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Individual Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: individual__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Individual Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: individual__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.assigner.type ;;
    group_label: "Individual Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: individual__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.period.`end` ;;
    group_label: "Individual Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: individual__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.period.start ;;
    group_label: "Individual Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: individual__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.system ;;
    group_label: "Individual Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: individual__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.individual.identifier.assigner.identifier.type.coding ;;
    group_label: "Individual Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: individual__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.type.text ;;
    group_label: "Individual Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: individual__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.use ;;
    group_label: "Individual Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: individual__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.identifier.value ;;
    group_label: "Individual Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: individual__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.organizationId ;;
    group_label: "Individual Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: individual__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.reference ;;
    group_label: "Individual Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: individual__identifier__assigner__type {
    type: string
    sql: ${TABLE}.individual.identifier.assigner.type ;;
    group_label: "Individual Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: individual__identifier__period__end {
    type: string
    sql: ${TABLE}.individual.identifier.period.`end` ;;
    group_label: "Individual Identifier Period"
    group_item_label: "End"
  }

  dimension: individual__identifier__period__start {
    type: string
    sql: ${TABLE}.individual.identifier.period.start ;;
    group_label: "Individual Identifier Period"
    group_item_label: "Start"
  }

  dimension: individual__identifier__system {
    type: string
    sql: ${TABLE}.individual.identifier.system ;;
    group_label: "Individual Identifier"
    group_item_label: "System"
  }

  dimension: individual__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.individual.identifier.type.coding ;;
    group_label: "Individual Identifier Type"
    group_item_label: "Coding"
  }

  dimension: individual__identifier__type__text {
    type: string
    sql: ${TABLE}.individual.identifier.type.text ;;
    group_label: "Individual Identifier Type"
    group_item_label: "Text"
  }

  dimension: individual__identifier__use {
    type: string
    sql: ${TABLE}.individual.identifier.use ;;
    group_label: "Individual Identifier"
    group_item_label: "Use"
  }

  dimension: individual__identifier__value {
    type: string
    sql: ${TABLE}.individual.identifier.value ;;
    group_label: "Individual Identifier"
    group_item_label: "Value"
  }

  dimension: individual__practitioner_id {
    type: string
    sql: ${TABLE}.individual.practitionerId ;;
    group_label: "Individual"
    group_item_label: "Practitioner ID"
  }

  dimension: individual__practitioner_role_id {
    type: string
    sql: ${TABLE}.individual.practitionerRoleId ;;
    group_label: "Individual"
    group_item_label: "Practitioner Role ID"
  }

  dimension: individual__reference {
    type: string
    sql: ${TABLE}.individual.reference ;;
    group_label: "Individual"
    group_item_label: "Reference"
  }

  dimension: individual__related_person_id {
    type: string
    sql: ${TABLE}.individual.relatedPersonId ;;
    group_label: "Individual"
    group_item_label: "Related Person ID"
  }

  dimension: individual__type {
    type: string
    sql: ${TABLE}.individual.type ;;
    group_label: "Individual"
    group_item_label: "Type"
  }

  dimension: period__end {
    type: string
    sql: ${TABLE}.period.`end` ;;
    group_label: "Period"
    group_item_label: "End"
  }

  dimension: period__start {
    type: string
    sql: ${TABLE}.period.start ;;
    group_label: "Period"
    group_item_label: "Start"
  }
}

# The name of this view in Looker is "Encounter Diagnosis Use Coding"
view: encounter__diagnosis__use__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Identifier Type Coding"
view: encounter__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Participant Type Coding"
view: encounter__participant__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Location Physical Type Coding"
view: encounter__location__physical_type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Part of Identifier Type Coding"
view: encounter__part_of__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Subject Identifier Type Coding"
view: encounter__subject__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Based on Identifier Type Coding"
view: encounter__based_on__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Diet Preference"
view: encounter__hospitalization__diet_preference {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Account Identifier Type Coding"
view: encounter__account__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Special Courtesy"
view: encounter__hospitalization__special_courtesy {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Appointment Identifier Type Coding"
view: encounter__appointment__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Special Arrangement"
view: encounter__hospitalization__special_arrangement {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: coding {
    hidden: yes
    sql: ${TABLE}.coding ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Text" in Explore.

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Re Admission Coding"
view: encounter__hospitalization__re_admission__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Admit Source Coding"
view: encounter__hospitalization__admit_source__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Episode of Care Identifier Type Coding"
view: encounter__episode_of_care__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Diet Preference Coding"
view: encounter__hospitalization__diet_preference__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Reason Reference Identifier Type Coding"
view: encounter__reason_reference__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Special Courtesy Coding"
view: encounter__hospitalization__special_courtesy__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Service Provider Identifier Type Coding"
view: encounter__service_provider__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Location Location Identifier Type Coding"
view: encounter__location__location__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Special Arrangement Coding"
view: encounter__hospitalization__special_arrangement__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Identifier Assigner Identifier Type Coding"
view: encounter__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Diagnosis Condition Identifier Type Coding"
view: encounter__diagnosis__condition__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Discharge Disposition Coding"
view: encounter__hospitalization__discharge_disposition__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Participant Individual Identifier Type Coding"
view: encounter__participant__individual__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Origin Identifier Type Coding"
view: encounter__hospitalization__origin__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Part of Identifier Assigner Identifier Type Coding"
view: encounter__part_of__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Subject Identifier Assigner Identifier Type Coding"
view: encounter__subject__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Based on Identifier Assigner Identifier Type Coding"
view: encounter__based_on__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Destination Identifier Type Coding"
view: encounter__hospitalization__destination__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Pre Admission Identifier Type Coding"
view: encounter__hospitalization__pre_admission_identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Account Identifier Assigner Identifier Type Coding"
view: encounter__account__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Appointment Identifier Assigner Identifier Type Coding"
view: encounter__appointment__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Episode of Care Identifier Assigner Identifier Type Coding"
view: encounter__episode_of_care__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Reason Reference Identifier Assigner Identifier Type Coding"
view: encounter__reason_reference__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Service Provider Identifier Assigner Identifier Type Coding"
view: encounter__service_provider__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Location Location Identifier Assigner Identifier Type Coding"
view: encounter__location__location__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Diagnosis Condition Identifier Assigner Identifier Type Coding"
view: encounter__diagnosis__condition__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Participant Individual Identifier Assigner Identifier Type Coding"
view: encounter__participant__individual__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Origin Identifier Assigner Identifier Type Coding"
view: encounter__hospitalization__origin__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Destination Identifier Assigner Identifier Type Coding"
view: encounter__hospitalization__destination__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Pre Admission Identifier Assigner Identifier Type Coding"
view: encounter__hospitalization__pre_admission_identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}

# The name of this view in Looker is "Encounter Hospitalization Pre Admission Identifier Assigner Identifier Assigner Identifier Type Coding"
view: encounter__hospitalization__pre_admission_identifier__assigner__identifier__assigner__identifier__type__coding {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Code" in Explore.

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: user_selected {
    type: yesno
    sql: ${TABLE}.userSelected ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}
