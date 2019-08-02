class CommentsController < ApplicationController

  def index
    if params[:user_id]
      comment = Comment.where(user_id: params[:user_id])
      render json: comment
    elsif params[:artwork_id]
      comment = Comment.where(artwork_id: params[:artwork_id])
      render json: comment
    else
      comments = Comment.all
      render json: comments
    end

  end

  def create
    comment = Comment.new(comment_params)

    if comment.save!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(comment_params[:id])
    comment.destroy
  end

  private
  def comment_params
    params.require(:comments).permit(:artwork_id, :body, :user_id)
  end


end