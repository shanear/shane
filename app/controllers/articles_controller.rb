class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def all
    @articles = Article.all
    render action: "index"
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    respond_to { |format| format.html }
  end

  def create
    @article = Article.create(params['article'])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article updated" }
      else
        format.html { render action: "new" }
      end
    end
  end
end
