class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:vote1, :vote2)
  end

end
