class PagesController < ApplicationController
  def main
    @articles = Article.limit(3)
    render layout: "main"
  end
end
