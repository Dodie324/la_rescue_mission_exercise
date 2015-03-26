class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id].to_i
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Answer saved!"
      redirect_to question_path(params[:question_id])
    else
      flash[:alert] = "Answer not saved, check length (must be at least 50 characters)"
      redirect_to question_path(params[:question_id])
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Answer Updated!'
      redirect_to question_path(@answer.question_id)
    else
      flash[:alert] = 'Answer Not Updated'
      render question_path(@answer.question_id)
    end
  end

  def show
    binding.pry
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = 'Answer deleted.'
    redirect_to question_path(@answer.question_id)
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end

end
