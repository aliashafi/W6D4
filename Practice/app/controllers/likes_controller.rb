class LikesController < ApplicationController

  def index 
    likes = Like.all
    render json: likes
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      debugger
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end




    private
    def like_params
      params.require(:likes).permit(:user_id, :likeable_type, :likeable_id)
    end
  
end