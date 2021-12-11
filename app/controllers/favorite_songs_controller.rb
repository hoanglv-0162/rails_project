class FavoriteSongsController < ApplicationController
  before_action :set_favorite_song, only: %i[ show edit update destroy ]

  # GET /favorite_songs or /favorite_songs.json
  def index
    @favorite_songs = FavoriteSong.all
  end

  # GET /favorite_songs/1 or /favorite_songs/1.json
  def show
  end

  # GET /favorite_songs/new
  def new
    @favorite_song = FavoriteSong.new
  end

  # GET /favorite_songs/1/edit
  def edit
  end

  # POST /favorite_songs or /favorite_songs.json
  def create
    @favorite_song = FavoriteSong.new(favorite_song_params)
    @favorite_song.user_id = current_user.id
    respond_to do |format|
      if @favorite_song.save
         url = "/songs/" + @favorite_song.song_id.to_s
        format.html { redirect_to url, notice: "Favorite song was successfully created." }
        format.json { render :show, status: :created, location: @favorite_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_songs/1 or /favorite_songs/1.json
  def update
    respond_to do |format|
      if @favorite_song.update(favorite_song_params)
        format.html { redirect_to @favorite_song, notice: "Favorite song was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_songs/1 or /favorite_songs/1.json
  def destroy
    @favorite_song.destroy
    respond_to do |format|
      format.html { redirect_to favorite_songs_url, notice: "Favorite song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_song
      @favorite_song = FavoriteSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_song_params
      params.require(:favorite_song).permit(:user_id, :song_id)
    end
end
