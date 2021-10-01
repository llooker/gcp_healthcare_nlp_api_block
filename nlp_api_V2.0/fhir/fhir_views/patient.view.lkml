# The name of this view in Looker is "Patient"
view: patient {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.healthcare_api_sandbox.Patient`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: address {
    hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: birth_date {
    type: string
    sql: ${TABLE}.birthDate ;;
  }

  dimension: communication {
    hidden: yes
    sql: ${TABLE}.communication ;;
  }

  dimension: contact {
    hidden: yes
    sql: ${TABLE}.contact ;;
  }

  dimension: deceased__boolean {
    type: yesno
    sql: ${TABLE}.deceased.boolean ;;
    group_label: "Deceased"
    group_item_label: "Boolean"
  }

  dimension: deceased__date_time {
    type: string
    sql: ${TABLE}.deceased.dateTime ;;
    group_label: "Deceased"
    group_item_label: "Date Time"
  }

  dimension: disability_adjusted_life_years__value__decimal {
    type: number
    sql: ${TABLE}.disability_adjusted_life_years.value.decimal ;;
    group_label: "Disability Adjusted Life Years Value"
    group_item_label: "Decimal"
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: general_practitioner {
    hidden: yes
    sql: ${TABLE}.generalPractitioner ;;
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

  dimension: link {
    hidden: yes
    sql: ${TABLE}.link ;;
  }

  dimension: managing_organization__display {
    type: string
    sql: ${TABLE}.managingOrganization.display ;;
    group_label: "Managing Organization"
    group_item_label: "Display"
  }

  dimension: managing_organization__identifier__assigner__display {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.display ;;
    group_label: "Managing Organization Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: managing_organization__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.assigner.display ;;
    group_label: "Managing Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: managing_organization__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Managing Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: managing_organization__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Managing Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: managing_organization__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.assigner.type ;;
    group_label: "Managing Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: managing_organization__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.period.`end` ;;
    group_label: "Managing Organization Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: managing_organization__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.period.start ;;
    group_label: "Managing Organization Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: managing_organization__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.system ;;
    group_label: "Managing Organization Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: managing_organization__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.type.coding ;;
    group_label: "Managing Organization Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: managing_organization__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.type.text ;;
    group_label: "Managing Organization Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: managing_organization__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.use ;;
    group_label: "Managing Organization Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: managing_organization__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.identifier.value ;;
    group_label: "Managing Organization Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: managing_organization__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.organizationId ;;
    group_label: "Managing Organization Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: managing_organization__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.reference ;;
    group_label: "Managing Organization Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: managing_organization__identifier__assigner__type {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.assigner.type ;;
    group_label: "Managing Organization Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: managing_organization__identifier__period__end {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.period.`end` ;;
    group_label: "Managing Organization Identifier Period"
    group_item_label: "End"
  }

  dimension: managing_organization__identifier__period__start {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.period.start ;;
    group_label: "Managing Organization Identifier Period"
    group_item_label: "Start"
  }

  dimension: managing_organization__identifier__system {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.system ;;
    group_label: "Managing Organization Identifier"
    group_item_label: "System"
  }

  dimension: managing_organization__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.managingOrganization.identifier.type.coding ;;
    group_label: "Managing Organization Identifier Type"
    group_item_label: "Coding"
  }

  dimension: managing_organization__identifier__type__text {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.type.text ;;
    group_label: "Managing Organization Identifier Type"
    group_item_label: "Text"
  }

  dimension: managing_organization__identifier__use {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.use ;;
    group_label: "Managing Organization Identifier"
    group_item_label: "Use"
  }

  dimension: managing_organization__identifier__value {
    type: string
    sql: ${TABLE}.managingOrganization.identifier.value ;;
    group_label: "Managing Organization Identifier"
    group_item_label: "Value"
  }

  dimension: managing_organization__organization_id {
    type: string
    sql: ${TABLE}.managingOrganization.organizationId ;;
    group_label: "Managing Organization"
    group_item_label: "Organization ID"
  }

  dimension: managing_organization__reference {
    type: string
    sql: ${TABLE}.managingOrganization.reference ;;
    group_label: "Managing Organization"
    group_item_label: "Reference"
  }

  dimension: managing_organization__type {
    type: string
    sql: ${TABLE}.managingOrganization.type ;;
    group_label: "Managing Organization"
    group_item_label: "Type"
  }

  dimension: marital_status__coding {
    hidden: yes
    sql: ${TABLE}.maritalStatus.coding ;;
    group_label: "Marital Status"
    group_item_label: "Coding"
  }

  dimension: marital_status__text {
    type: string
    sql: ${TABLE}.maritalStatus.text ;;
    group_label: "Marital Status"
    group_item_label: "Text"
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

  dimension: multiple_birth__boolean {
    type: yesno
    sql: ${TABLE}.multipleBirth.boolean ;;
    group_label: "Multiple Birth"
    group_item_label: "Boolean"
  }

  dimension: multiple_birth__integer {
    type: number
    sql: ${TABLE}.multipleBirth.integer ;;
    group_label: "Multiple Birth"
    group_item_label: "Integer"
  }

  dimension: name {
    hidden: yes
    sql: ${TABLE}.name ;;
  }

  dimension: patient_birth_place__value__address__city {
    type: string
    sql: ${TABLE}.patient_birthPlace.value.address.city ;;
    group_label: "Patient Birth Place Value Address"
    group_item_label: "City"
  }

  dimension: patient_birth_place__value__address__country {
    type: string
    sql: ${TABLE}.patient_birthPlace.value.address.country ;;
    group_label: "Patient Birth Place Value Address"
    group_item_label: "Country"
  }

  dimension: patient_birth_place__value__address__state {
    type: string
    sql: ${TABLE}.patient_birthPlace.value.address.state ;;
    group_label: "Patient Birth Place Value Address"
    group_item_label: "State"
  }

  dimension: patient_mothers_maiden_name__value__string {
    type: string
    sql: ${TABLE}.patient_mothersMaidenName.value.string ;;
    group_label: "Patient Mothers Maiden Name Value"
    group_item_label: "String"
  }

  dimension: photo {
    hidden: yes
    sql: ${TABLE}.photo ;;
  }

  dimension: quality_adjusted_life_years__value__decimal {
    type: number
    sql: ${TABLE}.quality_adjusted_life_years.value.decimal ;;
    group_label: "Quality Adjusted Life Years Value"
    group_item_label: "Decimal"
  }

  dimension: telecom {
    hidden: yes
    sql: ${TABLE}.telecom ;;
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

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_disability_adjusted_life_years__value__decimal {
    type: sum
    hidden: yes
    sql: ${disability_adjusted_life_years__value__decimal} ;;
  }

  measure: average_disability_adjusted_life_years__value__decimal {
    type: average
    hidden: yes
    sql: ${disability_adjusted_life_years__value__decimal} ;;
  }

  measure: total_multiple_birth__integer {
    type: sum
    hidden: yes
    sql: ${multiple_birth__integer} ;;
  }

  measure: average_multiple_birth__integer {
    type: average
    hidden: yes
    sql: ${multiple_birth__integer} ;;
  }

  measure: total_quality_adjusted_life_years__value__decimal {
    type: sum
    hidden: yes
    sql: ${quality_adjusted_life_years__value__decimal} ;;
  }

  measure: average_quality_adjusted_life_years__value__decimal {
    type: average
    hidden: yes
    sql: ${quality_adjusted_life_years__value__decimal} ;;
  }
}

# The name of this view in Looker is "Patient Name"
view: patient__name {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Family" in Explore.

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: given {
    hidden: yes
    sql: ${TABLE}.given ;;
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

  dimension: prefix {
    hidden: yes
    sql: ${TABLE}.prefix ;;
  }

  dimension: suffix {
    hidden: yes
    sql: ${TABLE}.suffix ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: use {
    type: string
    sql: ${TABLE}.use ;;
  }
}

# The name of this view in Looker is "Patient Link"
view: patient__link {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Other Display" in Explore.

  dimension: other__display {
    type: string
    sql: ${TABLE}.other.display ;;
    group_label: "Other"
    group_item_label: "Display"
  }

  dimension: other__identifier__assigner__display {
    type: string
    sql: ${TABLE}.other.identifier.assigner.display ;;
    group_label: "Other Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: other__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.assigner.display ;;
    group_label: "Other Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: other__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Other Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: other__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Other Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: other__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.assigner.type ;;
    group_label: "Other Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: other__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.period.`end` ;;
    group_label: "Other Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: other__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.period.start ;;
    group_label: "Other Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: other__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.system ;;
    group_label: "Other Identifier Assigner Identifier"
    group_item_label: "System"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: other__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.other.identifier.assigner.identifier.type.coding ;;
    group_label: "Other Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: other__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.type.text ;;
    group_label: "Other Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: other__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.use ;;
    group_label: "Other Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: other__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.other.identifier.assigner.identifier.value ;;
    group_label: "Other Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: other__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.other.identifier.assigner.organizationId ;;
    group_label: "Other Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: other__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.other.identifier.assigner.reference ;;
    group_label: "Other Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: other__identifier__assigner__type {
    type: string
    sql: ${TABLE}.other.identifier.assigner.type ;;
    group_label: "Other Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: other__identifier__period__end {
    type: string
    sql: ${TABLE}.other.identifier.period.`end` ;;
    group_label: "Other Identifier Period"
    group_item_label: "End"
  }

  dimension: other__identifier__period__start {
    type: string
    sql: ${TABLE}.other.identifier.period.start ;;
    group_label: "Other Identifier Period"
    group_item_label: "Start"
  }

  dimension: other__identifier__system {
    type: string
    sql: ${TABLE}.other.identifier.system ;;
    group_label: "Other Identifier"
    group_item_label: "System"
  }

  dimension: other__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.other.identifier.type.coding ;;
    group_label: "Other Identifier Type"
    group_item_label: "Coding"
  }

  dimension: other__identifier__type__text {
    type: string
    sql: ${TABLE}.other.identifier.type.text ;;
    group_label: "Other Identifier Type"
    group_item_label: "Text"
  }

  dimension: other__identifier__use {
    type: string
    sql: ${TABLE}.other.identifier.use ;;
    group_label: "Other Identifier"
    group_item_label: "Use"
  }

  dimension: other__identifier__value {
    type: string
    sql: ${TABLE}.other.identifier.value ;;
    group_label: "Other Identifier"
    group_item_label: "Value"
  }

  dimension: other__patient_id {
    type: string
    sql: ${TABLE}.other.patientId ;;
    group_label: "Other"
    group_item_label: "Patient ID"
  }

  dimension: other__reference {
    type: string
    sql: ${TABLE}.other.reference ;;
    group_label: "Other"
    group_item_label: "Reference"
  }

  dimension: other__related_person_id {
    type: string
    sql: ${TABLE}.other.relatedPersonId ;;
    group_label: "Other"
    group_item_label: "Related Person ID"
  }

  dimension: other__type {
    type: string
    sql: ${TABLE}.other.type ;;
    group_label: "Other"
    group_item_label: "Type"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

# The name of this view in Looker is "Patient Photo"
view: patient__photo {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Content Type" in Explore.

  dimension: content_type {
    type: string
    sql: ${TABLE}.contentType ;;
  }

  dimension: creation {
    type: string
    sql: ${TABLE}.creation ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.`hash` ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }
}

# The name of this view in Looker is "Patient Name Given"
view: patient__name__given {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Name Given" in Explore.

  dimension: patient__name__given {
    type: string
    sql: patient__name__given ;;
  }
}

# The name of this view in Looker is "Patient Telecom"
view: patient__telecom {
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

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
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

# The name of this view in Looker is "Patient Address"
view: patient__address {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: geolocation__latitude__value__decimal {
    type: number
    sql: ${TABLE}.geolocation.latitude.value.decimal ;;
    group_label: "Geolocation Latitude Value"
    group_item_label: "Decimal"
  }

  dimension: geolocation__longitude__value__decimal {
    type: number
    sql: ${TABLE}.geolocation.longitude.value.decimal ;;
    group_label: "Geolocation Longitude Value"
    group_item_label: "Decimal"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: line {
    hidden: yes
    sql: ${TABLE}.line ;;
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

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalCode ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: use {
    type: string
    sql: ${TABLE}.use ;;
  }
}

# The name of this view in Looker is "Patient Name Prefix"
view: patient__name__prefix {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Name Prefix" in Explore.

  dimension: patient__name__prefix {
    type: string
    sql: patient__name__prefix ;;
  }
}

# The name of this view in Looker is "Patient Name Suffix"
view: patient__name__suffix {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Name Suffix" in Explore.

  dimension: patient__name__suffix {
    type: string
    sql: patient__name__suffix ;;
  }
}

# The name of this view in Looker is "Patient Address Line"
view: patient__address__line {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Address Line" in Explore.

  dimension: patient__address__line {
    type: string
    sql: patient__address__line ;;
  }
}

# The name of this view in Looker is "Patient Meta Profile"
view: patient__meta__profile {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Meta Profile" in Explore.

  dimension: patient__meta__profile {
    type: string
    sql: patient__meta__profile ;;
  }
}

# The name of this view in Looker is "Patient Meta Tag"
view: patient__meta__tag {
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

# The name of this view in Looker is "Patient Contact"
view: patient__contact {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address City" in Explore.

  dimension: address__city {
    type: string
    sql: ${TABLE}.address.city ;;
    group_label: "Address"
    group_item_label: "City"
  }

  dimension: address__country {
    type: string
    sql: ${TABLE}.address.country ;;
    group_label: "Address"
    group_item_label: "Country"
  }

  dimension: address__district {
    type: string
    sql: ${TABLE}.address.district ;;
    group_label: "Address"
    group_item_label: "District"
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: address__line {
    hidden: yes
    sql: ${TABLE}.address.line ;;
    group_label: "Address"
    group_item_label: "Line"
  }

  dimension: address__period__end {
    type: string
    sql: ${TABLE}.address.period.`end` ;;
    group_label: "Address Period"
    group_item_label: "End"
  }

  dimension: address__period__start {
    type: string
    sql: ${TABLE}.address.period.start ;;
    group_label: "Address Period"
    group_item_label: "Start"
  }

  dimension: address__postal_code {
    type: string
    sql: ${TABLE}.address.postalCode ;;
    group_label: "Address"
    group_item_label: "Postal Code"
  }

  dimension: address__state {
    type: string
    sql: ${TABLE}.address.state ;;
    group_label: "Address"
    group_item_label: "State"
  }

  dimension: address__text {
    type: string
    sql: ${TABLE}.address.text ;;
    group_label: "Address"
    group_item_label: "Text"
  }

  dimension: address__type {
    type: string
    sql: ${TABLE}.address.type ;;
    group_label: "Address"
    group_item_label: "Type"
  }

  dimension: address__use {
    type: string
    sql: ${TABLE}.address.use ;;
    group_label: "Address"
    group_item_label: "Use"
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: name__family {
    type: string
    sql: ${TABLE}.name.family ;;
    group_label: "Name"
    group_item_label: "Family"
  }

  dimension: name__given {
    hidden: yes
    sql: ${TABLE}.name.given ;;
    group_label: "Name"
    group_item_label: "Given"
  }

  dimension: name__period__end {
    type: string
    sql: ${TABLE}.name.period.`end` ;;
    group_label: "Name Period"
    group_item_label: "End"
  }

  dimension: name__period__start {
    type: string
    sql: ${TABLE}.name.period.start ;;
    group_label: "Name Period"
    group_item_label: "Start"
  }

  dimension: name__prefix {
    hidden: yes
    sql: ${TABLE}.name.prefix ;;
    group_label: "Name"
    group_item_label: "Prefix"
  }

  dimension: name__suffix {
    hidden: yes
    sql: ${TABLE}.name.suffix ;;
    group_label: "Name"
    group_item_label: "Suffix"
  }

  dimension: name__text {
    type: string
    sql: ${TABLE}.name.text ;;
    group_label: "Name"
    group_item_label: "Text"
  }

  dimension: name__use {
    type: string
    sql: ${TABLE}.name.use ;;
    group_label: "Name"
    group_item_label: "Use"
  }

  dimension: organization__display {
    type: string
    sql: ${TABLE}.organization.display ;;
    group_label: "Organization"
    group_item_label: "Display"
  }

  dimension: organization__identifier__assigner__display {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.display ;;
    group_label: "Organization Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: organization__identifier__assigner__identifier__assigner__display {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.assigner.display ;;
    group_label: "Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Display"
  }

  dimension: organization__identifier__assigner__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.assigner.organizationId ;;
    group_label: "Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: organization__identifier__assigner__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.assigner.reference ;;
    group_label: "Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: organization__identifier__assigner__identifier__assigner__type {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.assigner.type ;;
    group_label: "Organization Identifier Assigner Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: organization__identifier__assigner__identifier__period__end {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.period.`end` ;;
    group_label: "Organization Identifier Assigner Identifier Period"
    group_item_label: "End"
  }

  dimension: organization__identifier__assigner__identifier__period__start {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.period.start ;;
    group_label: "Organization Identifier Assigner Identifier Period"
    group_item_label: "Start"
  }

  dimension: organization__identifier__assigner__identifier__system {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.system ;;
    group_label: "Organization Identifier Assigner Identifier"
    group_item_label: "System"
  }

  dimension: organization__identifier__assigner__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.organization.identifier.assigner.identifier.type.coding ;;
    group_label: "Organization Identifier Assigner Identifier Type"
    group_item_label: "Coding"
  }

  dimension: organization__identifier__assigner__identifier__type__text {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.type.text ;;
    group_label: "Organization Identifier Assigner Identifier Type"
    group_item_label: "Text"
  }

  dimension: organization__identifier__assigner__identifier__use {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.use ;;
    group_label: "Organization Identifier Assigner Identifier"
    group_item_label: "Use"
  }

  dimension: organization__identifier__assigner__identifier__value {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.identifier.value ;;
    group_label: "Organization Identifier Assigner Identifier"
    group_item_label: "Value"
  }

  dimension: organization__identifier__assigner__organization_id {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.organizationId ;;
    group_label: "Organization Identifier Assigner"
    group_item_label: "Organization ID"
  }

  dimension: organization__identifier__assigner__reference {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.reference ;;
    group_label: "Organization Identifier Assigner"
    group_item_label: "Reference"
  }

  dimension: organization__identifier__assigner__type {
    type: string
    sql: ${TABLE}.organization.identifier.assigner.type ;;
    group_label: "Organization Identifier Assigner"
    group_item_label: "Type"
  }

  dimension: organization__identifier__period__end {
    type: string
    sql: ${TABLE}.organization.identifier.period.`end` ;;
    group_label: "Organization Identifier Period"
    group_item_label: "End"
  }

  dimension: organization__identifier__period__start {
    type: string
    sql: ${TABLE}.organization.identifier.period.start ;;
    group_label: "Organization Identifier Period"
    group_item_label: "Start"
  }

  dimension: organization__identifier__system {
    type: string
    sql: ${TABLE}.organization.identifier.system ;;
    group_label: "Organization Identifier"
    group_item_label: "System"
  }

  dimension: organization__identifier__type__coding {
    hidden: yes
    sql: ${TABLE}.organization.identifier.type.coding ;;
    group_label: "Organization Identifier Type"
    group_item_label: "Coding"
  }

  dimension: organization__identifier__type__text {
    type: string
    sql: ${TABLE}.organization.identifier.type.text ;;
    group_label: "Organization Identifier Type"
    group_item_label: "Text"
  }

  dimension: organization__identifier__use {
    type: string
    sql: ${TABLE}.organization.identifier.use ;;
    group_label: "Organization Identifier"
    group_item_label: "Use"
  }

  dimension: organization__identifier__value {
    type: string
    sql: ${TABLE}.organization.identifier.value ;;
    group_label: "Organization Identifier"
    group_item_label: "Value"
  }

  dimension: organization__organization_id {
    type: string
    sql: ${TABLE}.organization.organizationId ;;
    group_label: "Organization"
    group_item_label: "Organization ID"
  }

  dimension: organization__reference {
    type: string
    sql: ${TABLE}.organization.reference ;;
    group_label: "Organization"
    group_item_label: "Reference"
  }

  dimension: organization__type {
    type: string
    sql: ${TABLE}.organization.type ;;
    group_label: "Organization"
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

  dimension: relationship {
    hidden: yes
    sql: ${TABLE}.relationship ;;
  }

  dimension: telecom {
    hidden: yes
    sql: ${TABLE}.telecom ;;
  }
}

# The name of this view in Looker is "Patient Identifier"
view: patient__identifier {
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

# The name of this view in Looker is "Patient Contact Name Given"
view: patient__contact__name__given {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Contact Name Given" in Explore.

  dimension: patient__contact__name__given {
    type: string
    sql: patient__contact__name__given ;;
  }
}

# The name of this view in Looker is "Patient Meta Security"
view: patient__meta__security {
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

# The name of this view in Looker is "Patient Contact Name Prefix"
view: patient__contact__name__prefix {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Contact Name Prefix" in Explore.

  dimension: patient__contact__name__prefix {
    type: string
    sql: patient__contact__name__prefix ;;
  }
}

# The name of this view in Looker is "Patient Contact Name Suffix"
view: patient__contact__name__suffix {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Contact Name Suffix" in Explore.

  dimension: patient__contact__name__suffix {
    type: string
    sql: patient__contact__name__suffix ;;
  }
}

# The name of this view in Looker is "Patient Contact Telecom"
view: patient__contact__telecom {
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

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
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

# The name of this view in Looker is "Patient Contact Address Line"
view: patient__contact__address__line {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Patient Contact Address Line" in Explore.

  dimension: patient__contact__address__line {
    type: string
    sql: patient__contact__address__line ;;
  }
}

# The name of this view in Looker is "Patient Communication"
view: patient__communication {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: language__coding {
    hidden: yes
    sql: ${TABLE}.language.coding ;;
    group_label: "Language"
    group_item_label: "Coding"
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Language Text" in Explore.

  dimension: language__text {
    type: string
    sql: ${TABLE}.language.text ;;
    group_label: "Language"
    group_item_label: "Text"
  }

  dimension: preferred {
    type: yesno
    sql: ${TABLE}.preferred ;;
  }
}

# The name of this view in Looker is "Patient General Practitioner"
view: patient__general_practitioner {
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

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organizationId ;;
  }

  dimension: practitioner_id {
    type: string
    sql: ${TABLE}.practitionerId ;;
  }

  dimension: practitioner_role_id {
    type: string
    sql: ${TABLE}.practitionerRoleId ;;
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

# The name of this view in Looker is "Patient Contact Relationship"
view: patient__contact__relationship {
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

# The name of this view in Looker is "Patient Marital Status Coding"
view: patient__marital_status__coding {
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

# The name of this view in Looker is "Patient Identifier Type Coding"
view: patient__identifier__type__coding {
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

# The name of this view in Looker is "Patient Contact Relationship Coding"
view: patient__contact__relationship__coding {
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

# The name of this view in Looker is "Patient Communication Language Coding"
view: patient__communication__language__coding {
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

# The name of this view in Looker is "Patient Link Other Identifier Type Coding"
view: patient__link__other__identifier__type__coding {
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

# The name of this view in Looker is "Patient General Practitioner Identifier Type Coding"
view: patient__general_practitioner__identifier__type__coding {
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

# The name of this view in Looker is "Patient Identifier Assigner Identifier Type Coding"
view: patient__identifier__assigner__identifier__type__coding {
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

# The name of this view in Looker is "Patient Contact Organization Identifier Type Coding"
view: patient__contact__organization__identifier__type__coding {
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

# The name of this view in Looker is "Patient Managing Organization Identifier Type Coding"
view: patient__managing_organization__identifier__type__coding {
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

# The name of this view in Looker is "Patient Link Other Identifier Assigner Identifier Type Coding"
view: patient__link__other__identifier__assigner__identifier__type__coding {
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

# The name of this view in Looker is "Patient General Practitioner Identifier Assigner Identifier Type Coding"
view: patient__general_practitioner__identifier__assigner__identifier__type__coding {
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

# The name of this view in Looker is "Patient Contact Organization Identifier Assigner Identifier Type Coding"
view: patient__contact__organization__identifier__assigner__identifier__type__coding {
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

# The name of this view in Looker is "Patient Managing Organization Identifier Assigner Identifier Type Coding"
view: patient__managing_organization__identifier__assigner__identifier__type__coding {
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
