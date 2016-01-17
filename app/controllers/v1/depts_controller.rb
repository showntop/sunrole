class V1::DeptsController < ApplicationController
  before_action :set_dept, only: [:show, :update, :destroy]

  # GET /depts
  # GET /depts.json
  def index
    @depts = Dept.roots.includes(:children)
    render json: @depts, each_serializer: V1::DeptSerializer, root: false
  end

  # GET /depts/1
  # GET /depts/1.json
  def show
    render json: @dept
  end

  # POST /depts
  # POST /depts.json
  def create
    @dept = Dept.new(dept_params)

    if @dept.save
      render json: @dept, status: :created, location: @dept
    else
      render json: @dept.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /depts/1
  # PATCH/PUT /depts/1.json
  def update
    @dept = Dept.find(params[:id])

    if @dept.update(dept_params)
      head :no_content
    else
      render json: @dept.errors, status: :unprocessable_entity
    end
  end

  # DELETE /depts/1
  # DELETE /depts/1.json
  def destroy
    @dept.destroy

    head :no_content
  end

  private

    def set_dept
      @dept = Dept.find(params[:id])
    end

    def dept_params
      params.require(:dept).permit(:name, :description, :parent_id)
    end
end
