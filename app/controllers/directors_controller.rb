class DirectorsController < ApplicationController
  def index
    @director = Director.all
    render("/directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("directors/show_details.html.erb")

  end

  def new_form
    render("/directors/new_form.html.erb")
  end

  def create_row
    d = Director.new
    d.dob = params[:dob]
    d.name = params[:name]
    d.bio = params[:bio]
    d.image_url = params[:image_url]
    d.save

    redirect_to("/directors/#{d.id}")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("/directors/edit_form.html.erb")
  end

  def update_row
    d = Director.find(params[:id])

    d.dob = params[:the_dob]
    d.name = params[:the_name]
    d.bio = params[:the_bio]
    d.image_url = params[:the_image_url]

    d.save

    redirect_to("/directors/#{d.id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
