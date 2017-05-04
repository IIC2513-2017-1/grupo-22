class TopicsController < ApplicationController

  before_action :set_topic, only: [:show]

  def show
  end

  def new
  end	

  def create
    @foro = Foro.find(params[:foro_id])
    @topic = @foro.topics.create(topic_params)
    @topic.update(user_id: current_user.id)
    redirect_to foro_path(@foro)
  end

 
  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
