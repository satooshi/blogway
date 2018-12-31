class ArticleController < ApplicationController
  getter article = Article.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_article }
  end

  def index
    articles = Article.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    article = Article.new article_params.validate!
    if article.save
      redirect_to action: :index, flash: {"success" => "Created article successfully."}
    else
      flash["danger"] = "Could not create Article!"
      render "new.slang"
    end
  end

  def update
    article.set_attributes article_params.validate!
    if article.save
      redirect_to action: :index, flash: {"success" => "Updated article successfully."}
    else
      flash["danger"] = "Could not update Article!"
      render "edit.slang"
    end
  end

  def destroy
    article.destroy
    redirect_to action: :index, flash: {"success" => "Deleted article successfully."}
  end

  private def article_params
    params.validation do
      required :title
      required :markdown
      required :html
      required :plain_text
      required :is_public
      required :published_at
      required :url
    end
  end

  private def set_article
    @article = Article.find! params[:id]
  end
end
