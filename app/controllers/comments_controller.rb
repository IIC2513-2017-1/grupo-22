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
        @comments = @topic.comments
        format.html { redirect_to topic_path(@topic), notice: 'Comment created.' }
        format.js {flash.now[:notice] = "Comment added"}
      else
        format.html { redirect_to topic_path(@topic)}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {redirect_to edit_comment_path(@comment)}
      format.js
    end
  end


  def update
    @comment.update(comment_params)

    respond_to do |format|
      format.html {redirect_to topic_path(@comment.topic), notice: "Comment updated"}
    end

  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to topic_path(@topic), message: 'Comment was deleted.' }
        format.json { render :show, status: :created, location: @comment}
        format.js {flash.now[:message] = "Comment deleted"}
      else
        format.html 
        format.json { render json: @comment.errors, alert: 'Couldn\'t delete comment' }
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
