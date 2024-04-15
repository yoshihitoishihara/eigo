class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @videos = Video.joins(:user).where("body LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
    else
      @videos = Video.all
    end
    if params[:check_ids]
      @videos = []
      params[:check_ids].each do |key, value|      
        @videos += Check.find_by(name: key).videos if value == "1"
      end
      @videos.uniq!
    end
    if params[:check_ids]
      @videos = []
      params[:check_ids].each do |key, value|
        if value == "1"
          check_videos = Check.find_by(name: key).videos
          @videos = @videos.empty? ? check_videos : @videos & check_videos
        end
      end
    end
  end

  # GET /videos/1 or /videos/1.json
  def show
    @video = Video.find(params[:id])
    @replies = @video.replies
    @reply = Reply.new
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    url = params[:video][:youtube_url]
    url = url.last(11)
    @video.youtube_url = url
    respond_to do |format|
      if @video.save
        format.html { redirect_to video_url(@video), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:body, :youtube_url, check_ids: [])
    end
end
