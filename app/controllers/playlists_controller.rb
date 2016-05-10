class PlaylistsController < ApplicationController
  def index
  end

  def create
    @song = Song.find(params[:id])
    @playlist = @song.playlists.where(user_id: session[:id]).first
    if @playlist.nil?
      @playlist = @song.playlists.create(user_id: session[:id])
    else
      @playlist.times_added += 1
      @playlist.save
    end
    redirect_to "/users/#{session[:id]}"
  end
end
