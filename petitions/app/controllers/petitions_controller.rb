class PetitionsController < ApplicationController

  before_action :authorize, only: [:create, :new, :my_petitions]

  def new
  
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
        redirect_to petition_path(@petition.id), notice: 'Вы успешно создали петицию'
      else
        flash[:error] = 'Произошла ошибка! Попробуйте еще раз.'
        render 'new'
      end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def petition_params
    params.require(:petition).permit(:title, :description, :user_id)
  end
end
