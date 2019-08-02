require 'byebug'

class UsersController < ApplicationController

    def index
      
      ## if query exists in params 
      ## filter it... this is gonna be a method in our models 
      if params[:user_name]
        user = User.where(user_name: params[:user_name])
        render json: user
      else
        users = User.all
        render json: users
      end
    end

    def create

      # user = User.new(params.require(:user).permit(:user_name, :email))
      user = User.new(user_params)
      if user.save!
        render json: user
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      user = User.find( params[:id] )
      render json: user
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
    end

    def update
      user = User.find(params[:id])
      debugger
      if user.update(user_params)
        render json: user
      else
        render json: user.errors.full_messages, status: 422
      end
    end


    private
    def user_params
      params.require(:user).permit(:user_name, :email)
    end
  

end