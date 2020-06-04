class Web::InterviewsController < ApplicationController
  def index
    @articles = Article.interview.page(params[:page]).per(20)
    @pick_up_articles = @articles.interview.pick_up
  end
end
