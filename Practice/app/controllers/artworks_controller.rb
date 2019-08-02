require 'byebug'

class ArtworksController < ApplicationController

    def index
      arts = Artwork.where(artist_id: params[:user_id])
      render json: arts
    end

    def create

      # art = art.new(params.require(:art).permit(:user_name, :email))
      art = Artwork.new(art_params)
      if art.save!
        render json: art
      else
        render json: art.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      art = Artwork.find( params[:id] )
      render json: art
    end

    def destroy
      art = Artwork.find(params[:id] )
      art.destroy
    end

    def update
      art = Artwork.find(params[:id])
      
      if art.update(art_params)
        render json: art
      else
        render json: art.errors.full_messages, status: 422
      end
    end

    def favorite
      art=Artwork.find(params[:id])
      if art.update(art_params)
        render json: art
      else
        render json: art.errors.full_messages, status: 422
      end
    end


    private
    def art_params
      params.require(:artworks).permit(:title, :artist_id, :image_url, :favorite)
    end
  

end