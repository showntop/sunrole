class ArchievesController < ApplicationController
  # GET /archieves
  # GET /archieves.json
  def index
    @archieves = Archieve.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archieves }
    end
  end

  # GET /archieves/1
  # GET /archieves/1.json
  def show
    @archiefe = Archieve.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @archiefe }
    end
  end

  # GET /archieves/new
  # GET /archieves/new.json
  def new
    @archiefe = Archieve.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @archiefe }
    end
  end

  # GET /archieves/1/edit
  def edit
    @archiefe = Archieve.find(params[:id])
  end

  # POST /archieves
  # POST /archieves.json
  def create
    @archiefe = Archieve.new(params[:archiefe])

    respond_to do |format|
      if @archiefe.save
        format.html { redirect_to @archiefe, notice: 'Archieve was successfully created.' }
        format.json { render json: @archiefe, status: :created, location: @archiefe }
      else
        format.html { render action: "new" }
        format.json { render json: @archiefe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /archieves/1
  # PUT /archieves/1.json
  def update
    @archiefe = Archieve.find(params[:id])

    respond_to do |format|
      if @archiefe.update_attributes(params[:archiefe])
        format.html { redirect_to @archiefe, notice: 'Archieve was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @archiefe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archieves/1
  # DELETE /archieves/1.json
  def destroy
    @archiefe = Archieve.find(params[:id])
    @archiefe.destroy

    respond_to do |format|
      format.html { redirect_to archieves_url }
      format.json { head :no_content }
    end
  end
end
