module ApplicationHelper

  # see https://gist.github.com/roberto/3344628
  def bootstrap_class_for flash_type
    {
      success: 'alert-success',
      error: 'alert-error',
      alert: 'alert-block',
      notice: 'alert-info'
    } [flash_type] || flash_type.to_s
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
end
