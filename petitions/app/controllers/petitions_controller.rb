class PetitionsController < ApplicationController

  before_action :authorize, only: [:create, :new, :my_petitions]

  def new
  
  end

  def index
    @petitions = Petition.select(params[:id]).last(10)
  end

  def all
    @petitions = Petition.all
  end

  def create
      @petition = Petition.new(petition_params)
      @petition.user = current_user
      if @petition.save
        redirect_to petition_path(@petition.id), notice: 'Вы успешно создали петицию'
      else
        flash[:error] = 'Произошла ошибка! Попробуйте еще раз.'
        render 'new'
      end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def my_petitions
    @my_petitions = current_user.petitions.all
  end

  def petition_params
    params.require(:petition).permit(:title, :description, :user_id)

  end

 
end
