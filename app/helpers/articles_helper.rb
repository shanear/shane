module ArticlesHelper
  def article_date(article)
    if article.published?
      article.published_at.to_date.to_s(:long)
    else
      "(Unpublished) #{article.created_at.to_date.to_s(:long)}"
    end
  end
end