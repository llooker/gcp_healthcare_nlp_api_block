- dashboard: nlp_patient
  title: NLP Patient View V1
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Observation Text
    name: Observation Text
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_grid
    fields: [document_reference.id, nlp_results.text_highlighted]
    sorts: [document_reference.id desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      document_reference.id: left
    column_order: ["$$$_row_numbers_$$$", document_reference.id, nlp_results.text_highlighted]
    show_totals: true
    show_row_totals: true
    series_labels: {}
    series_column_widths:
      document_reference.id: 143
    series_text_format:
      document_reference.id:
        fg_color: "#000000"
      nlp_results.text_highlighted:
        fg_color: "#000000"
    header_font_color: "#fffcf1"
    header_background_color: "#4285F4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 15
    bodyFontSize: 12
    showTooltip: false
    showHighlight: false
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|document_reference.id: Observation ID
    heading|document_reference.id: ''
    hide|document_reference.id: false
    label|document_reference.patient_id: Patient ID
    heading|document_reference.patient_id: ''
    hide|document_reference.patient_id: false
    label|nlp_results.text_highlighted: Text (highlighted)
    heading|nlp_results.text_highlighted: ''
    hide|nlp_results.text_highlighted: false
    label|document_reference__content.title: Title
    heading|document_reference__content.title: ''
    hide|document_reference__content.title: false
    subtotalDepth: '1'
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Patient ID: document_reference.patient_id
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 0
    width: 24
    height: 6
  - name: <p><center> <b> <font size="6"> <font color="black"> <span class='fa fa-file'></span>
      NLP Patient View <p>
    type: text
    title_text: <p><center> <b> <font size="6"> <font color="black"> <span class='fa
      fa-file'></span> NLP Patient View <p>
    subtitle_text: ''
    body_text: "<center>A deep dive into the GCP NLP Output to view clinical notes,\
      \ sorted by most recent observations"
    row: 0
    col: 4
    width: 16
    height: 3
  - title: NLP Context Assessment
    name: NLP Context Assessment
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_grid
    fields: [nlp_results.id, nlp_results__entity_mentions.text_begin_offset, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.text_content, nlp_results__entity_mentions.type,
      nlp_results__entity_mentions.subject_value, nlp_results__entity_mentions.temporal_assessment_value,
      nlp_results__entity_mentions.certainty_assessment_value, nlp_results__entity_mentions.confidence]
    filters:
      nlp_results__entity_mentions.text_content: "-NULL"
      nlp_results__entities.preferred_term: "-NULL"
    sorts: [nlp_results__entity_mentions.text_begin_offset, nlp_results__entity_mentions.confidence
        desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", nlp_results__entity_mentions.text_begin_offset,
      nlp_results__entity_mentions.text_content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.type, nlp_results__entity_mentions.subject_value,
      nlp_results__entity_mentions.temporal_assessment_value, nlp_results__entity_mentions.certainty_assessment_value,
      nlp_results__entity_mentions.confidence]
    show_totals: true
    show_row_totals: true
    series_labels:
      nlp_results__entity_mentions.text_begin_offset: Text Location
      nlp_results__entity_mentions.text_content: Original Text
    series_cell_visualizations:
      nlp_results__entity_mentions.count:
        is_active: false
    series_text_format:
      nlp_results__entity_mentions.count:
        align: center
      nlp_results__entity_mentions.text_content:
        fg_color: "#000000"
      nlp_results__entity_mentions.confidence:
        bold: true
        align: center
      nlp_results__entity_mentions.certainty_assessment_value:
        fg_color: "#000000"
      nlp_results__entity_mentions.temporal_assessment_value:
        fg_color: "#000000"
      nlp_results__entity_mentions.subject_value:
        fg_color: "#000000"
      nlp_results__entity_mentions.type:
        fg_color: "#000000"
      nlp_results__entities.preferred_term:
        fg_color: "#000000"
      nlp_results__entity_mentions.text_begin_offset:
        fg_color: "#000000"
    header_font_color: "#fff8ff"
    header_background_color: "#4285F4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, reverse: false,
            stepped: false}}, bold: false, italic: false, strikethrough: false, fields: [
          nlp_results__entity_mentions.confidence]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [nlp_results.id]
    listen:
      Patient ID: document_reference.patient_id
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 9
    col: 0
    width: 24
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://cdn.opsmatters.com/sites/default/files/logos/looker-thumb2.png"
      width="150" height="150"/>
    row: 0
    col: 0
    width: 4
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <a href='https://demoexpo.looker.com/dashboards-next/968?Preferred+Term=Traumatic+injury&Confidence+Range=%5B0%2C100%5D'><button>Navigate to NLP Preferred Term View</button>
      </a>
      <br>

      <a href='insert link'><button>Navigate to Patient Journey</button>
      </a>
    row: 0
    col: 21
    width: 3
    height: 3
  filters:
  - name: Patient ID
    title: Patient ID
    type: field_filter
    default_value: 004521d6-bb57-42d7-a99d-ae5989a6695b
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: healthcare_nlp_api
    explore: nlp_results_extended
    listens_to_filters: []
    field: document_reference.patient_id
  - name: Confidence Range
    title: Confidence Range
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: healthcare_nlp_api
    explore: nlp_results_extended
    listens_to_filters: []
    field: nlp_results__entity_mentions.confidence_percent
