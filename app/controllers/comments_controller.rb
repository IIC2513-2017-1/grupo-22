class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_topic, only: [:new, :create, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end	

  def create
    @comment = @topic.comments.create(comment_params)
    @comment.update(user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment}
        format.js
      else
        format.html { redirect_to topic_path(@topic)}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to topic_path(@comment.topic)
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to topic_path(@topic), notice: 'Comment was successfully deleted.' }
        format.json { render :show, status: :created, location: @comment}
        format.js
      else
        format.html 
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
 
  private
    def set_comment
      @comment= Comment.find(params[:id])
    end

    def set_topic
      @topic= Topic.find(params[:topic_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
