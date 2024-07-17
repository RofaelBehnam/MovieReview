class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /movies/:id/reviews
  def index
    @movie = Movie.find_by_token(params[:id])
    @reviews = Review.where("movie_id = #{@movie[:id]}")
    render json: @reviews
  end

  # GET /movies/:id/reviews/:id
  def show
    render json: @reviews
  end

  # POST /movies/:id/reviews
  def create
    @review = Review.new(review_params)

    if @review.save
       render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PUT /movies/:id/reviews/:id
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id/reviews/:id
  def destroy
    @review.destroy
  end
  
     # POST /reviews/import
   def import
    CsvReviewImportService.new.call(params[:file])
   end

  private
     def set_review
       @review = Review.find(params[:id])
     end
 
     def review_params
       params.require(:review).permit(:movie_id, :user, :review, :stars)
     end
end
