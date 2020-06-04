class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(20)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def create
    article = Article.new(article_params)
    article.category = params[:article][:category].to_i
    article.pick_up = true if params[:article][:pick_up] == "1"
    if article.save!
      redirect_to action: "index"
    else
      redirect_to :back
    end
  end


  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    article = Article.find_by(id: params[:id])
    article.category = params[:article][:category].to_i
    article.pick_up = true if params[:article][:pick_up] == "1"
    if article.update(article_params)
      redirect_to action: "show", id: params[:id]
    else
      redirect_to :back
    end
  end

  def destroy
    article = Article.find_by(id: params[:id])
    article.destroy! if article
    redirect_to action: "index"
  end

  def pick_up_list
    @articles = Article.pick_up.page(params[:page]).per(20)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :main_image, article_chapter_blocks_attributes: [:id, :title, :_destroy, {article_collections_attributes: [:id, :title, :content, :chapter_image,:link,:type_code, :_destroy]}])
  end
end
