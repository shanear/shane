module ApplicationHelper
  def markdown(text)
    markdown_renderer.render(text).html_safe
  end

  private

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end
end
