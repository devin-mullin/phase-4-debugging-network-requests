class MoviesController < ApplicationController
  
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: movie.errors.full_messages}, status: :unprocessable_entity
  end


  private
  
  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster, :category, :female_director, :discount)
  end

end
