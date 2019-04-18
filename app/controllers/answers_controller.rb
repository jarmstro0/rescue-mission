class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = 'Most excellent'
      redirect_to @answer.question
    else
      flash[:notice] = @answer.errors.full_messages
      redirect_to @answer.question
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end
