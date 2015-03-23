class QuestionsController < ApplicationController
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
    @question.created_by = current_user.id
    binding.pry
    if @question.save
      binding.pry
      flash[:notice] = 'Question added!'
      redirect_to '/'
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
