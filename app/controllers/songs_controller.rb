class SongsController < ApplicationController
  def index
    @user = User.find(session[:id])
    @song = Song.order(:created_at).reverse
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to "/songs"
    else
      flash[:errors] = "There was an error adding your song"
      redirect_to "/songs"
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
  end

private

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
