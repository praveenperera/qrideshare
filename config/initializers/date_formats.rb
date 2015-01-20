Date::DATE_FORMATS[:month_and_year] = '%B %Y'
Date::DATE_FORMATS[:short_ordinal] = ->(date) { date.strftime("%b #{date.day.ordinalize}") }