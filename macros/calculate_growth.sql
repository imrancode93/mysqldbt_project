{% macro calculate_growth(current_value, previous_value) %}
  CASE
    WHEN {{ previous_value }} = 0 OR {{ previous_value }} IS NULL THEN NULL
    ELSE ({{ current_value }} - {{ previous_value }}) / {{ previous_value }} * 100
  END
{% endmacro %}
