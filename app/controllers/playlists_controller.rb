class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def edit
    @songs = Song.all
  end

  def update
      if @playlist.update(playlist_params)
        redirect_to playlist_path(@playlist)
      else
        render :edit
      end
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

end
