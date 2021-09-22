- dashboard: nlp_preferred_term
  title: NLP Preferred Term View V1
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Clinical Notes Processed by NLP
    name: Clinical Notes Processed by NLP
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_grid
    fields: [document_reference.id, document_reference.patient_id, nlp_results.text_highlighted]
    sorts: [document_reference.id desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      document_reference.id: left
      document_reference.patient_id: left
      nlp_results.text_highlighted: left
    column_order: ["$$$_row_numbers_$$$", document_reference.id, document_reference.patient_id,
      nlp_results.text_highlighted]
    show_totals: true
    show_row_totals: true
    series_labels: {}
    series_column_widths:
      document_reference.id: 145
      document_reference.patient_id: 128
      nlp_results.text_highlighted: 1348
    series_text_format:
      document_reference.id:
        fg_color: "#000000"
      nlp_results.text_highlighted:
        fg_color: "#000000"
      document_reference.patient_id:
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
    note_state: collapsed
    note_display: above
    note_text: 'Recommended Action: Drill into Patient ID to Navigate to Patient View'
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 5
    col: 8
    width: 16
    height: 9
  - name: <p><center> <b> <font size="6"> <font color="black"> <span class='fa fa-file'></span>
      NLP Preferred Term View <p>
    type: text
    title_text: <p><center> <b> <font size="6"> <font color="black"> <span class='fa
      fa-file'></span> NLP Preferred Term View <p>
    subtitle_text: ''
    body_text: "<center>A deep dive into the GCP NLP Output Preferred Term/Condition\
      \ and all associated observations "
    row: 0
    col: 4
    width: 16
    height: 3
  - title: NLP Context Assessment
    name: NLP Context Assessment
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_grid
    fields: [nlp_results.id, nlp_results__entity_mentions.text_begin_offset, nlp_results__entity_mentions.text_content,
      nlp_results__entities.preferred_term, nlp_results__entity_mentions.type, nlp_results__entity_mentions.subject_value,
      nlp_results__entity_mentions.temporal_assessment_value, nlp_results__entity_mentions.certainty_assessment_value,
      nlp_results__entity_mentions.confidence]
    filters:
      nlp_results__entity_mentions.text_content: "-NULL"
    sorts: [nlp_results.id desc, nlp_results__entity_mentions.text_begin_offset]
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
    pinned_columns:
      nlp_results.id: left
    column_order: ["$$$_row_numbers_$$$", nlp_results.id, nlp_results__entity_mentions.text_begin_offset,
      nlp_results__entity_mentions.text_content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.type, nlp_results__entity_mentions.subject_value,
      nlp_results__entity_mentions.temporal_assessment_value, nlp_results__entity_mentions.certainty_assessment_value,
      nlp_results__entity_mentions.confidence]
    show_totals: true
    show_row_totals: true
    series_labels:
      nlp_results__entity_mentions.text_begin_offset: Text Location
      nlp_results__entity_mentions.text_content: Original Text
      nlp_results__entities.vocabulary_codes_string: Vocabulary Codes
    series_column_widths:
      nlp_results.id: 251
    series_cell_visualizations:
      nlp_results__entity_mentions.count:
        is_active: false
      nlp_results__entity_mentions.confidence:
        is_active: false
    series_text_format:
      nlp_results__entity_mentions.count:
        align: center
      nlp_results__entity_mentions.text_content:
        fg_color: "#000000"
      nlp_results__entity_mentions.confidence:
        align: center
        fg_color: "#000000"
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
      nlp_results.id:
        fg_color: "#000000"
      nlp_results__entities.vocabulary_codes_string:
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
    hidden_fields:
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 14
    col: 8
    width: 16
    height: 8
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
  - title: Preferred Term and Count of Unique Mentions
    name: Preferred Term and Count of Unique Mentions
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_bar
    fields: [nlp_results__entities.preferred_term, nlp_results__entity_mentions.count]
    filters:
      nlp_results__entities.preferred_term: "-NULL"
    sorts: [nlp_results__entity_mentions.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count: "#34A853"
    defaults_version: 1
    listen: {}
    row: 3
    col: 0
    width: 8
    height: 7
  - title: Preferred Term Selected
    name: Preferred Term Selected
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: single_value
    fields: [nlp_results__entities.preferred_term, nlp_results__entity_mentions.count]
    sorts: [nlp_results__entity_mentions.count desc]
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    defaults_version: 1
    hidden_fields: [nlp_results__entity_mentions.count]
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 8
    width: 4
    height: 2
  - title: Minimum Confidence
    name: Minimum Confidence
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_min]
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
    single_value_title: Minimum Confidence
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 18
    width: 3
    height: 2
  - title: Maximum Confidence
    name: Maximum Confidence
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_max]
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
    single_value_title: Maximum Confidence
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 21
    width: 3
    height: 2
  - title: Count of Unique Mentions
    name: Count of Unique Mentions
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: single_value
    fields: [nlp_results__entity_mentions.count]
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
    single_value_title: Count of Unique Mentions
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 15
    width: 3
    height: 2
  - title: Count of Observations
    name: Count of Observations
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: single_value
    fields: [document_reference.count]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_observation_id, based_on: document_reference.id,
        expression: '', label: Count of Observation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
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
    single_value_title: Count of Observations
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: true
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '25'
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 3
    col: 12
    width: 3
    height: 2
  - title: Vocabulary Source
    name: Vocabulary Source
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_grid
    fields: [nlp_results__entities.preferred_term, nlp_results__entities__vocabulary_codes.vocabulary_code,
      nlp_results__entities__vocabulary_codes.vocabulary]
    sorts: [nlp_results__entities.preferred_term]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", document_reference.id, document_reference.patient_id,
      nlp_results.text_highlighted]
    show_totals: true
    show_row_totals: true
    series_labels:
      nlp_results__entities__vocabulary_codes.vocabulary_code: Vocab Code
    series_column_widths: {}
    series_text_format:
      document_reference.id:
        fg_color: "#000000"
      nlp_results.text_highlighted:
        fg_color: "#000000"
      document_reference.patient_id:
        fg_color: "#000000"
      nlp_results__entities__vocabulary_codes.vocabulary:
        fg_color: "#000000"
      nlp_results__entities__vocabulary_codes.vocabulary_code:
        fg_color: "#000000"
      nlp_results__entities.preferred_term:
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
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 16
    col: 0
    width: 8
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <a href='https://cloud.google.com/healthcare/docs/concepts/nlp#supported_medical_knowledge_categories'><button>External Link To GCP NLP API Docs</button>
      </a>
    row: 0
    col: 21
    width: 3
    height: 3
  - title: Distribution of Confidence by Mean,  Median, and Frequency
    name: Distribution of Confidence by Mean,  Median, and Frequency
    model: healthcare_nlp_api
    explore: nlp_results_extended
    type: looker_scatter
    fields: [nlp_results__entity_mentions.mention_id, nlp_results__entity_mentions.confidence_min,
      nlp_results__entity_mentions.confidence_max, nlp_results__entity_mentions.confidence_mean,
      nlp_results__entity_mentions.confidence_median, count_of_observation_id]
    sorts: [nlp_results__entity_mentions.confidence_min desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_observation_id, based_on: nlp_results.id,
        expression: '', label: Count of Observation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: nlp_results__entity_mentions.confidence_median,
            id: nlp_results__entity_mentions.confidence_median, name: Confidence Median}],
        showLabels: true, showValues: true, maxValue: 1.1, unpinAxis: false, tickDensity: default,
        type: linear}]
    size_by_field: count_of_observation_id
    hidden_series: [nlp_results__entity_mentions.confidence_min, nlp_results__entity_mentions.confidence_max,
      nlp_results__entity_mentions.confidence_mean]
    hide_legend: true
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.confidence_mean: "#FBBC04"
    series_labels:
      nlp_results__entity_mentions.text_begin_offset: Text Location
      nlp_results__entity_mentions.text_content: Original Text
      nlp_results__entities.vocabulary_codes_string: Vocabulary Codes
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      nlp_results__entity_mentions.count:
        is_active: false
      nlp_results__entity_mentions.confidence:
        is_active: false
    series_text_format:
      nlp_results__entity_mentions.count:
        align: center
      nlp_results__entity_mentions.text_content:
        fg_color: "#000000"
      nlp_results__entity_mentions.confidence:
        align: center
        fg_color: "#000000"
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
      nlp_results.id:
        fg_color: "#000000"
      nlp_results__entities.vocabulary_codes_string:
        fg_color: "#000000"
    header_font_color: "#fff8ff"
    header_background_color: "#014377"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, reverse: false,
            stepped: false}}, bold: false, italic: false, strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_fields: [nlp_results__entity_mentions.confidence_min, nlp_results__entity_mentions.confidence_max,
      nlp_results__entity_mentions.mention_id]
    series_column_widths:
      nlp_results.id: 251
    pinned_columns:
      nlp_results.id: left
    column_order: ["$$$_row_numbers_$$$", nlp_results.id, nlp_results__entity_mentions.text_begin_offset,
      nlp_results__entity_mentions.text_content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.type, nlp_results__entity_mentions.subject_value,
      nlp_results__entity_mentions.temporal_assessment_value, nlp_results__entity_mentions.certainty_assessment_value,
      nlp_results__entity_mentions.confidence]
    note_state: expanded
    note_display: above
    note_text: "<center>Points Sized by Frequency of Observations<center>"
    listen:
      Preferred Term: nlp_results__entities.preferred_term
      Confidence Range: nlp_results__entity_mentions.confidence_percent
    row: 10
    col: 0
    width: 8
    height: 6
  filters:
  - name: Preferred Term
    title: Preferred Term
    type: field_filter
    default_value: Traumatic injury
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: healthcare_nlp_api
    explore: nlp_results_extended
    listens_to_filters: []
    field: nlp_results__entities.preferred_term
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
