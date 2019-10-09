class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
