class Magazine::HomeController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(20)
  end
end
