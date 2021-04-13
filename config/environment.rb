# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#Adjusts the div class of field with errors that Rails adds to an input field with a validation error.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
