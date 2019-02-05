class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    #binding.pry



    @comment.user_id = current_user.id

      if @comment.save
        redirect_to topics_path, success: 'コメントが完了しました'
      else
        flash.now[:danger] = "コメントに失敗しました"
        render :new
      end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment ,:topic_id)
  end

end
