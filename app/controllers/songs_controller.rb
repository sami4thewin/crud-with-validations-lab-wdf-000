class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def create
    # binding.pry
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    # binding.pry
    @song = Song.find_by(id: params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def delete
   @song = Song.find(params[:id])
   @song.destroy
   redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end


end
