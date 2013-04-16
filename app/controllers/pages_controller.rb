class PagesController < ApplicationController
  def main
    @articles = Article.limit(3)
    redirect_to blog_path
    #render layout: "main"
  end
end
