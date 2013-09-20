class ArtworksController < ApplicationController
  layout "gallery"

  def show
    @artwork = Artwork.find(params[:id])
  end
end