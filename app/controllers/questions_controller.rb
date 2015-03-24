class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    id = params[:id]
    @question = Question.find(id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = 'Question added!'
      redirect_to @question
    else
      flash[:notice] = 'Question not added!'
      render :new
    end
  end

  def edit
    id = params[:id]
    @question = Question.find(id)
  end

  def update
    binding.pry
    id = params[:id]
    @question = Question.find(id)
    @question.update!(question_params)
    redirect_to @question
  end

  def destroy
    id = params[:id]
    @question = Question.find(id)
    @question.destroy
    flash[:notice] = 'Question deleted.'
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
