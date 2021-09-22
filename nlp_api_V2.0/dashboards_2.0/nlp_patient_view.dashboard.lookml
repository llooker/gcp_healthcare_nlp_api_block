- dashboard: nlp_patient_view
  title: NLP Patient View
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n\theight: 54px; \n\tbackground-color: #fff; \n\tcolor:\
      \ #5f6368; \n\tborder-radius: 54px; \n\tborder: solid 1px #5f6368; \n\tfont-family:\
      \ Google Sans,Noto Sans,Noto Sans JP,Noto Sans KR,Noto Naskh Arabic,Noto Sans\
      \ Thai,Noto Sans Hebrew,Noto Sans Bengali,sans-serif; \n\tpadding: 12px;\">\n\
      <span style=\"\n\twidth: 38px;\n\theight: 38px; \n\tborder-radius: 60px; \n\t\
      background-color: white; \n\tdisplay:table-cell; \n\tvertical-align:middle;\
      \ \n\ttext-align:center; \n\tmargin-right: 12px; \n\tfloat: left;\">\n<img width=\"\
      30px\" src=\"https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png\"\
      />\n</span>\n\n<span style=\"\n\tpadding: 4px; \n\tfloat:left;\">\n\t<h1 style=\"\
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tNLP Patient\
      \ View\n\t</h1>\n</span>\n<span style=\"padding: 4px; float:right;\">\n\t<a\
      \ style=\"background-color: #fff; color: #5f6368; padding: 5px 10px;\" href=\"\
      /boards/82\">Home</a>\n\t<a style=\"background-color: #fff; color: #5f6368;\
      \ padding: 5px 10px;\" href=\"https://cloud.google.com/healthcare/docs/how-tos/nlp\"\
      >NLP API Documentation</a>\n\t<a style=\"background-color: #fff; color: #5f6368;\
      \ padding: 5px 10px;\" href=\"/dashboards-next/healthcare_nlp_api_2.0::nlp_term_view_2_0\"\
      >Go to Term View</a>\n</span>\n\n<div>"
    row: 0
    col: 0
    width: 19
    height: 2
  - title: Highlighted Observation Text
    name: Highlighted Observation Text
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: looker_grid
    fields: [kaggle_clinical_notes_nlp_results.id, kaggle_clinical_notes_nlp_results.text_highlighted]
    filters:
      kaggle_clinical_notes_nlp_results.id: ''
    sorts: [kaggle_clinical_notes_nlp_results.id]
    limit: 3
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      kaggle_clinical_notes_nlp_results.id: Observation ID
      kaggle_clinical_notes_nlp_results.text_highlighted: Highlighted Text
    series_column_widths:
      kaggle_clinical_notes_nlp_results.id: 147.01
    series_text_format:
      kaggle_clinical_notes_nlp_results.id:
        align: left
    header_font_color: "#000000"
    header_background_color: "#E8EAED"
    defaults_version: 1
    hidden_fields: [kaggle_clinical_notes_nlp_results.id]
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 4
    col: 8
    width: 16
    height: 10
  - title: Age
    name: Age
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.age]
    sorts: [kaggle_clinical_notes_nlp_results.age desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Years of Age
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 4
    col: 0
    width: 4
    height: 3
  - title: Sex
    name: Sex
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.sex]
    sorts: [kaggle_clinical_notes_nlp_results.sex]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Sex
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 7
    col: 0
    width: 4
    height: 3
  - title: Avg LOS
    name: Avg LOS
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.average_los_days]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Average LOS in Days
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 4
    col: 4
    width: 4
    height: 3
  - title: Avg LOS - All
    name: Avg LOS - All
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.average_los_days]
    sorts: [kaggle_clinical_notes_nlp_results.average_los_days desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Average LOS in Days (All Patients)
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 7
    col: 4
    width: 4
    height: 3
  - title: Last Visit Service Type
    name: Last Visit Service Type
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.service]
    sorts: [kaggle_clinical_notes_nlp_results.service desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5F6368"
    single_value_title: Last Visit Service Type
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Selected Patient
    name: Selected Patient
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results.patient_id]
    sorts: [kaggle_clinical_notes_nlp_results.patient_id]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5F6368"
    single_value_title: Selected Patient
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Has Allergies (Y/N)
    name: Has Allergies (Y/N)
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: single_value
    fields: [kaggle_clinical_notes_nlp_results__entity_mentions.has_allergies]
    fill_fields: [kaggle_clinical_notes_nlp_results__entity_mentions.has_allergies]
    sorts: [kaggle_clinical_notes_nlp_results__entity_mentions.has_allergies]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5F6368"
    single_value_title: Has Allergies? (Y/N)
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 2
    col: 16
    width: 8
    height: 2
  - title: LIKELY Current Medications
    name: LIKELY Current Medications
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: looker_grid
    fields: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset,
      kaggle_clinical_notes_nlp_results__entity_mentions.text__content, kaggle_clinical_notes_nlp_results__entity_mentions.type,
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]
    filters:
      kaggle_clinical_notes_nlp_results__entity_mentions.is_patient_current_medication: 'Yes'
    sorts: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset]
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
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent:
        is_active: false
    header_font_color: "#fcffff"
    header_background_color: "#34A853"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]}]
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
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 14
    col: 8
    width: 8
    height: 9
  - title: LIKELY Clinical History
    name: LIKELY Clinical History
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: looker_grid
    fields: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset,
      kaggle_clinical_notes_nlp_results__entity_mentions.text__content, kaggle_clinical_notes_nlp_results__entity_mentions.type,
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]
    filters:
      kaggle_clinical_notes_nlp_results__entity_mentions.type: ''
      kaggle_clinical_notes_nlp_results__entity_mentions.is_patient_clinical_history: 'Yes'
    sorts: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset]
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
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset,
      kaggle_clinical_notes_nlp_results__entity_mentions.text__content, kaggle_clinical_notes_nlp_results__entity_mentions.subject__value,
      kaggle_clinical_notes_nlp_results__entity_mentions.temporal_assessment__value,
      kaggle_clinical_notes_nlp_results__entity_mentions.certainty_assessment__value,
      kaggle_clinical_notes_nlp_results__entity_mentions.type, kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent:
        is_active: false
    header_font_color: "#fcffff"
    header_background_color: "#FBBC04"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]}]
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
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 14
    col: 16
    width: 8
    height: 9
  - title: LIKELY Current Problems/Conditions
    name: LIKELY Current Problems/Conditions
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: looker_grid
    fields: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset,
      kaggle_clinical_notes_nlp_results__entity_mentions.text__content, kaggle_clinical_notes_nlp_results__entity_mentions.type,
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]
    filters:
      kaggle_clinical_notes_nlp_results__entity_mentions.is_patient_current_problem: 'Yes'
    sorts: [kaggle_clinical_notes_nlp_results__entity_mentions.text__begin_offset]
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
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent:
        is_active: false
    header_font_color: "#fcffff"
    header_background_color: "#4285F4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [kaggle_clinical_notes_nlp_results__entity_mentions.confidence_percent]}]
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
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 14
    col: 0
    width: 8
    height: 9
  - title: Vocabulary Coding
    name: Vocabulary Coding
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    type: looker_grid
    fields: [kaggle_clinical_notes_nlp_results__entity_mentions.text__content, kaggle_clinical_notes_nlp_results__entity_mentions.type,
      kaggle_nlp_results_vocab.vocab_codes_linked, kaggle_clinical_notes_nlp_results__entity_mentions.confidence_mean]
    filters:
      kaggle_nlp_results_vocab.vocabulary: "-No Code Available"
      kaggle_clinical_notes_nlp_results__entity_mentions.type: ''
    sorts: [kaggle_clinical_notes_nlp_results__entity_mentions.confidence_mean desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      kaggle_clinical_notes_nlp_results__entity_mentions.confidence_mean:
        is_active: true
        palette:
          palette_id: google-diverging-0
          collection_id: google
    header_font_color: "#000000"
    header_background_color: "#E8EAED"
    defaults_version: 1
    series_types: {}
    listen:
      Patient ID: kaggle_clinical_notes_nlp_results.patient_id
    row: 10
    col: 0
    width: 8
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <body>
      <p><b>Color Key: </b><br>
      <mark style="color: white; background-color: #4285F4">Blue</mark>: Patient Current Problem/Condition<br>
      <mark style="color: white; background-color:#0F9D58">Green</mark>: Patient Current Medication <br>
      <mark style="color: white; background-color:#F4B400">Yellow</mark>: Patient Clinical History <br>
      </p>
      </body>
    row: 0
    col: 19
    width: 5
    height: 2
  filters:
  - name: Patient ID
    title: Patient ID
    type: field_filter
    default_value: 2002-08-05M
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: healthcare_nlp_api_2.0
    explore: kaggle_clinical_notes_nlp_results
    listens_to_filters: []
    field: kaggle_clinical_notes_nlp_results.patient_id
