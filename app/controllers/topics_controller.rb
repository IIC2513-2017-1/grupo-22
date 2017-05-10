class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @topic = Topic.new
  end	

  def create
    @foro = Foro.find(params[:foro_id])
    @topic = @foro.topics.create(topic_params)
    @topic.update(user_id: current_user.id)
    redirect_to foro_path(@foro)
  end

  def edit
  end

  def update
    @topic.update(topic_params)
    redirect_to foro_path(@topic.foro)
  end

  def destroy
    @topic.destroy
    redirect_to(:back)
  end
 
  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
