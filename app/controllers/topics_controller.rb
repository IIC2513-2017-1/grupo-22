class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_foro, only: [:destroy]

  def show
    @comments = @topic.comments.order(created_at: :asc)
    
    respond_to do |format|
      format.html 
      format.json { render json: @comments }
      format.js
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @foro = Foro.find(params[:foro_id])
    @topic = @foro.topics.create(topic_params)
    @topic.update(user_id: current_user.id)

    respond_to do |format|
      if @topic.save
        @topics = @foro.topics
        TopicMailer.new_topic_email(@topic).deliver_later
        format.html { redirect_to foro_path(@foro), notice: 'Topic was created.' }
        format.js {flash.now[:notice] = "Topic was created" }
      else
        format.html { redirect_to foro_path(@foro)}
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {redirect_to edit_topic_path(@topic)}
      format.js
    end
  end

  def update
    @topic.update(topic_params)

    respond_to do |format|
      format.html {redirect_to foro_path(@topic.foro), notice: "Topic updated"}
    end
  end

  def destroy
    respond_to do |format|
      if @topic.destroy
        format.html { redirect_to foro_path(@foro), message: 'Topic was successfully deleted.' }
        format.json { render :show, status: :created, location: @topic}
        format.js {flash.now[:message] = "Topic deleted"}
      else
        format.html { redirect_to foro_path(@foro)}
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_foro
      @foro = @topic.foro
    end

    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
