module ApplicationHelper

def format_date(time)
time.strftime("%b %d,%Y") + " coming frm helper method  "
end

def render_flash
ret = ""

unless flash[:error].blank?
ret << "<div id ='flash_error'>#{flash[:error]}</div>"
end

unless flash[:notice].blank?
ret << "<div id ='flash_notice'>#{flash[:notice]}</div>"
end

raw(ret)

end

end


