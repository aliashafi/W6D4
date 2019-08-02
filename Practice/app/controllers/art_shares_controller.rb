class ArtSharesController < ApplicationController

  def index
    artwork = ArtShare.where(viewer_id: params[:user_id])
    render json: artwork
  end

  def create
    artwork = ArtShare.new(art_params)
    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    art = ArtShare.find(params[:id])
    art.destroy
  end

  def create_favorite
    
    
    art = ArtShare.find(params[:id])
    if art.update(art_params)
      render json: art
    else
      render json: art.errors.full_messages, status: 422
    end

  end

  def get_favorite
    if params[:user_id]
      art = ArtShare.where(viewer_id: params[:user_id]).where.not
      render json: art
    end

    # art = ArtShare.find(params[:id])
    # render json: art

  end

  private
  def art_params
    params.require(:art_shares).permit(:artist_id, :viewer_id, :favorite)
  end
  

end