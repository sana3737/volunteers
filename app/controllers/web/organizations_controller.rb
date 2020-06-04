class Web::OrganizationsController < ApplicationController
  def index
    @cond = Organization.search(params[:q])
    @organizations = @cond.result(distinct: true).page(params[:page]).per(20)
  end

  def serach
    @q = Organization.ransack(params[:name])
    @organizations = @q.result
  end
end
