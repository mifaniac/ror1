class PetitionsController < ApplicationController

  before_action :authorize, only: [:create, :new, :my_petitions, :update, :destroy]

  def new
    @petition = Petition.new
  end

  def index
    if params[:my]
      @header_title = "Мои петиции"
      @petitions = current_user.petitions.all
    elsif params[:all]
      @header_title = "Все петиции"
      @petitions = Petition.all
    else
      @header_title = "Последние петиции"
      @petitions = Petition.select(params[:id]).last(10).reverse
    end
  end

  def create
      @petition = Petition.new(petition_params)
      @petition.user = current_user
      if @petition.save
        flash[:notice] = "Вы успешно создали петицию"
        redirect_to @petition
      else
        flash[:errors] = ['Произошла ошибка! Попробуйте еще раз.']
        render 'new'
      end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def petition_params
    params.require(:petition).permit(:title, :description, :user_id, :date, :created_at, :vote_id)
  end

  def upvote
    @petition = Petition.find(params[:id])
    @petition.votes.create(user_id: current_user.id)
    redirect_to petition_path(@petition.id), notice: 'Спасибо за ваш голос!'
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def update
    @petition = Petition.active.find(params[:id])
    if @petition.update(petition_params)
      flash[:notice] = "Петиция обновлена"
      redirect_to @petition
    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    flash[:errors] = ["Петиция удалена"]
    redirect_to petitions_path
  end


end
