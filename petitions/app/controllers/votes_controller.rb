class VotesController < ApplicationController
  before_action :check_expired
  def new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to petition_path, notice: "Спасибо за ваш голос!"
    else
      flash[:errors] = ['Произошла ошибка! Попробуйте еще раз.']
      render 'new'
    end

  end

  def vote_params
    params.require(:votes).permit(:user_id, :petition_id)
  end

  def check_expired
    redirect_to petition_path if Petition.find(vote_params).expired?
  end


end
