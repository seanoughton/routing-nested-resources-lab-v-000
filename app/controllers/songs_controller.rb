class SongsController < ApplicationController
  def index
    #needs to see if artist can be found 
    #has to deal with edge cases where the person enters in something that causes an Active Record exception
    #maybe a model method to see if the Artist exists in the database
    #Artist.where(id: '12345').first
    #Artist.where(id: 'abc') both of these return an empty relation
    #Artist.where(id: '12345').first == true
    #Artist.where(id: 'abc').first == true both of these return false
    
    byebug
    Artist.artist_exists?(params[:artist_id])
    if params[:artist_id]
      if params[:artist_id].class == Integer
        @songs = Artist.find(params[:artist_id]).songs
      else
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(params[:id])
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

