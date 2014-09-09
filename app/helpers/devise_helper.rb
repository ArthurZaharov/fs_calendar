module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "The form contain #{pluralize(resource.errors.count, "error")}:"

    html = <<-HTML
    <div class="row">
      <div class="col-sm-offset-2 col-sm-4">
        <div id="error_explanation">
          <div class="alert alert-danger">
            #{sentence}
            <ul>
              #{messages}
            </ul>
          </div>
        </div>
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end