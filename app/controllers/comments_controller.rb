class CommentsController < ApplicationController
  def new
     @question = Question.find(params[:question_id])
     @comment = @question.comments.new
   end

   def create
     @question = Question.find(params[:question_id])
     @comment = @question.comments.new(comment_params)
     if @comment.save
       flash[:notice] = "You have saved your comment!"
       redirect_to questions_path
     else
       render :new
     end
   end

  private
   def comment_params
     params.require(:comment).permit(:username, :body)
   end
  end
