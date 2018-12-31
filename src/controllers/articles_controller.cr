class ArticlesController < ApplicationController
  getter articles = Articles.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_articles }
  end

  def index
    articles = Articles.all
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
    articles = Articles.new articles_params.validate!
    if articles.save
      redirect_to action: :index, flash: {"success" => "Created articles successfully."}
    else
      flash["danger"] = "Could not create Articles!"
      render "new.slang"
    end
  end

  def update
    articles.set_attributes articles_params.validate!
    if articles.save
      redirect_to action: :index, flash: {"success" => "Updated articles successfully."}
    else
      flash["danger"] = "Could not update Articles!"
      render "edit.slang"
    end
  end

  def destroy
    articles.destroy
    redirect_to action: :index, flash: {"success" => "Deleted articles successfully."}
  end

  private def articles_params
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

  private def set_articles
    @articles = Articles.find! params[:id]
  end
end
