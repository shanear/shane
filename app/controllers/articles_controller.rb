class ArticlesController < ApplicationController
  layout "blog"
  before_filter :requires_admin,
    only: [:admin, :new, :create, :edit, :update, :publish]

  def index
    @articles = Article.published
  end

  def admin
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @subtitle = @article.title
  end

  def new
    @article = Article.new
    respond_to { |format| format.html }
  end

  def create
    @article = Article.create(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Created!" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
    render action: "new"
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: "Updated!" }
      else
        format.html { render @article }
      end
    end
  end

  def publish
    @article = Article.find(params[:id])

    if @article.publish
      redirect_to :article, notice: "Published!"
    else
      redirect_to :article, error: "An error occured"
    end
  end
end
