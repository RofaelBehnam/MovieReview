class FilmingsController < ApplicationController
  before_action :set_filming, only: [:show, :update, :destroy]

  # GET /movies/:id/filmings
  def index
    @movie = Movie.find_by_token(params[:id])
    @filmings = Filming.where("movie_id = #{@movie[:id]}")
    render json: @filmings
  end

  # GET /movies/:id/filmings/:id
  def show
    render json: @filmings
  end

  # POST /movies/:id/filmings
  def create
    @filming = Filming.new(filming_params)

    if @filming.save
       render json: @filming, status: :created
    else
      render json: @filming.errors, status: :unprocessable_entity
    end
  end

  # PUT /movies/:id/filmings/:id
  def update
    if @filming.update(filming_params)
      render json: @filming
    else
      render json: @filming.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id/filmings/:id
  def destroy
    @filming.destroy
  end

  private
     def set_filming
       @filming = Filming.find(params[:id])
     end
 
     def filming_params
       params.require(:filming).permit(:movie_id, :country, :actor, :filming_location)
     end
end
