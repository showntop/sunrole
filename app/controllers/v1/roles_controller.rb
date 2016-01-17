class V1::RolesController < ApplicationController

  def index
    @roles = Role.paginate(:page => params[:page], :per_page => params[:pageSize])
    render json: @roles, each_serializer: V1::RoleSerializer, root: false
  end

  def show
    
  end

  def edit
    
  end

  def destroy
    
  end

  def create
    render json: {message: 'hi'}
  end

end
