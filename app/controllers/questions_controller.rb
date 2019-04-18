class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was successfully created.'
      redirect_to @question
    else
      flash.now[:notice] = @question.errors.full_messages
      render action: :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to @question
    else
      flash.now[:notice] = @question.errors.full_messages
      render action: :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
  end


private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
