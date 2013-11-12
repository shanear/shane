class PagesController < ApplicationController
  def main
    @articles = Article.published.limit(3)
    render layout: "main"
  end

  def matt
    render layout: "matt"
  end
end
