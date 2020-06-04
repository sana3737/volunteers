class Web::ColumnsController < ApplicationController
  def index
    @articles = Article.column.page(params[:page]).per(20)
    @pick_up_articles = @articles.column.pick_up
  end
end
