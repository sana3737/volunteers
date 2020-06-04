class Admin::HomeController < ApplicationController
  before_action :authenticate_admin_user!, only: :index
  def index
  end
end
