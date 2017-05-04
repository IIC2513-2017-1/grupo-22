class CommentsController < ApplicationController
	before_action :set_comment, only: [:show]

  def show
  end

  def new
  end	

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    @comment.update(user_id: current_user.id)
    redirect_to topic_path(@topic)
  end

 
  private
    def set_comment
      @comment= Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
