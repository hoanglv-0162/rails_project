class ReviewSongsController < ApplicationController
  before_action :set_review_song, only: %i[ show edit update destroy ]

  # GET /review_songs or /review_songs.json
  def index
    @review_songs = ReviewSong.all
  end

  # GET /review_songs/1 or /review_songs/1.json
  def show
  end

  # GET /review_songs/new
  def new
    @review_song = ReviewSong.new
  end

  # GET /review_songs/1/edit
  def edit
  end

  # POST /review_songs or /review_songs.json
  def create
    @review_song = ReviewSong.new(review_song_params)
    @review_song.user_id = current_user.id
    respond_to do |format|
      if @review_song.save
        url = "/songs/" + @review_song.song_id.to_s
        format.html { redirect_to url, notice: 'Song review was successfully created.' }
        format.json { render :show, status: :created, location: @review_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_songs/1 or /review_songs/1.json
  def update
    respond_to do |format|
      if @review_song.update(review_song_params)
        format.html { redirect_to @review_song, notice: "Review song was successfully updated." }
        format.json { render :show, status: :ok, location: @review_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_songs/1 or /review_songs/1.json
  def destroy
    @review_song.destroy
    respond_to do |format|
      format.html { redirect_to review_songs_url, notice: "Review song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_song
      @review_song = ReviewSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_song_params
      params.require(:review_song).permit(:user_id, :song_id, :review)
    end
end
