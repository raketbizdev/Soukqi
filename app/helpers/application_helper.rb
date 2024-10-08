module ApplicationHelper
  def app_name
    "Soukqi"
  end

  def flash_messages
    flash.each do |type, message|
      concat(content_tag(:div, message, class: "alert alert-#{type} alert-dismissible fade show", role: "alert") do
        concat content_tag(:button, "x", class: "close", data: { dismiss: "alert" }, aria: { label: "Close" })
        concat message
      end)
    end
    nil
  end

  private

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      "alert-success"
    when :error
      "alert-danger"
    when :alert
      "alert-warning"
    when :notice
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
