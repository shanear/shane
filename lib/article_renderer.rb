class ArticleRenderer < Redcarpet::Render::HTML
  def image(link, title, alt_text)
    <<-HTML
      <div class='image'>
        <img src='/assets/blog/#{link}' alt='#{alt_text}'/>
        <div class='caption'>#{alt_text}</div>
      </div>
    HTML
  end
end