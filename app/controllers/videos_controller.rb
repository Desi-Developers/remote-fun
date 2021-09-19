# frozen_string_literal: true

# Videos Controller
class VideosController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_video, only: %i[destroy]

  def index
    @videos = current_employee.videos
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to videos_path, notice: 'Video uploaded successfully'
    else
      render 'new'
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path, notice: 'Video deleted successfully'
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :file, :employee_challenge_id)
  end

  def set_video
    @video = Video.find_by_id(params[:id])
  end
end
