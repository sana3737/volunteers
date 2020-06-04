class Admin::OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all.page(params[:page]).per(20)
  end

  def new
    @organization = Organization.new
  end

  def show
    @organization = Organization.find_by(id: params[:id])
  end

  def create
    organization = Organization.new(organization_params)
    if organization.save!
      redirect_to action: "index"
    else
      redirect_to :back
    end
  end

  def edit
    @organization = Organization.find_by(id: params[:id])
  end

  def update
    organization = Organization.find_by(id: params[:id])
    if organization.update(organization_params)
      redirect_to action: "show", id: params[:id]
    else
      redirect_to :back
    end
  end

  def destroy
    organization = Organization.find_by(id: params[:id])
    organization.destroy! if organization
    redirect_to action: "index"
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :description, :prefecture_id)
  end
end
