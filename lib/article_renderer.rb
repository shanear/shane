class ArticleRenderer < Redcarpet::Render::HTML
  def image(link, title, alt_text)
    "<img src='#{link}' alt='#{alt_text}/><div class='caption'>#{alt_text}</div>"
  end
end