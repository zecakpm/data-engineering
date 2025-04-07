{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }}
    WHERE
    -- minus at the end to trim spaces
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}