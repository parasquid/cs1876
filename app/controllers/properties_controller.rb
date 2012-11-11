class PropertiesController < ApplicationController
  def index
    @properties = Property.filter(session[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  def show
    @property = Property[params[:id]]

    respond_to do |format|
      format.html # show.html.erb
      format.text { render 'show', formats: [:html], layout: false }
      format.json { render json: @property }
    end
  end

  def new
    @property = Property.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  def edit
    @property = Property[params[:id]]
  end

  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @property = Property[params[:id]]

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property = Property[params[:id]]
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  def search
    session[:search] = Search.new(params[:search])
    redirect_to properties_path
  end
end
