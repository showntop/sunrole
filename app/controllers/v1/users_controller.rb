class V1::UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page], :per_page => params[:pageSize])
    render json: @users, each_serializer: V1::UserSerializer, root: false
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
