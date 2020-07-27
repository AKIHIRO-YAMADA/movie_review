class MovieCommentsController < ApplicationController
  def  show
      @movie_comment = MovieComment.find(params[:id])
  end

  def create
    movie = Movie.find(params[:movie_id])
    comment = current_user.movie_comments.new(comment: params[:movie_comment][:comment], rate: params[:rate], spoiler: params[:spoiler])
    binding.pry
    comment.movie_id = movie.id
    comment.save
    redirect_to movie_path(movie)
  end

  def destroy
    MovieComment.find_by(id: params[:id], movie_id: params[:movie_id]).destroy
    redirect_to movie_path(params[:movie_id])
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :spoiler, :rate)
  end
end
