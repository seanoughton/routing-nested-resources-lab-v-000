class SongsController < ApplicationController

  def index
    #either all of the songs
    #or all of the songs for a particular artist
    #just redefines which list of songs to show
    if params[:artist_id]
      if Artist.exists?(params[:artist_id])
        @songs = Artist.find(params[:artist_id]).songs
      else
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    #redirects to artists songs when artist song not found
    #if the params has an artist id, then you set the artist, you set the song
    #if there is no song, then you need to redirect_to artist_songs_path(@artist), alert: "Song not found"
    if params[:artist_id] && Artist.exists?(params[:artist_id])
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find_by(id: params[:id])
        if !Song.exists?(params[:id])
          redirect_to artist_songs_path(@artist), alert: "Song not found"
        end
    else
      @song = Song.find(params[:id])
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
