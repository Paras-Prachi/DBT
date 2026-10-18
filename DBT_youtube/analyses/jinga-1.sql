{%- set list= ["one","two","three","Four"] -%}
{%- for i in list -%}
    {% if i != "two" %}
        {{ i }}
    {% else %}
        I dont_like {{ i }}
    {% endif %}
{% endfor %}