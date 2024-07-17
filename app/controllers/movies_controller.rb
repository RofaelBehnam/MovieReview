class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movie
  def index
    @movies = Movie.all
    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

   # PATCH/PUT /movies/1
   def update
     if @movie.update(movie_params)
       render json: @movie
     else
       render json: @movie.errors, status: :unprocessable_entity
     end
   end

   # DELETE /movies/1
   def destroy
     @movie.destroy
   end

   private

     def set_movie
       @movie = Movie.find(params[:id])
     end

     def movie_params
       params.require(:movie).permit(:title, :description, :director, :year)
     end
end
