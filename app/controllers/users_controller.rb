class UsersController < ApplicationController
  def index

  end

  def show
    @famille = Famille.find(params[:famille_id])
    @user = User.find(params[:id])
    @mesidees = @user.idees.all
    @sesidees = User.find(@user.give_to_user).idees.all if @user.participant
    @idee = Idee.new
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

end
