class Magazine::ArticlesController < ApplicationController
  def index
    if params[:category]
      case  params[:category].to_s
      when "column"
        @articles = Article.column.page(params[:page]).per(20)
      when "interview"
        @articles = Article.interview.page(params[:page]).per(20)
      when "news"
        @articles = Article.news.page(params[:page]).per(20)
      end
    else
      @articles = Article.all.page(params[:page]).per(20)
    end
  end
end
