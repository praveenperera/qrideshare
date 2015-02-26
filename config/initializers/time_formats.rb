Time::DATE_FORMATS[:time_12_hour]  = ->(time) { time.strftime("%l:%M %p") }
Time::DATE_FORMATS[:full_datetime]  = ->(time) { time.strftime("%B %e, %Y %l:%M %p") }
Time::DATE_FORMATS[:short_datetime]  = ->(time) { time.strftime("%b/%e/%Y %l:%M %p") }


