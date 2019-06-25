class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    #binding.pry
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  private 

  def song_params
    params.require(:song).permit(:title, :release, :release_year, :artist_name, :genre)
  end
end
