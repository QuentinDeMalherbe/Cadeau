class IdeesController < ApplicationController
    def index

  end

  def show

  end

  def new
    @user = User.find(params[:user_id])
    @idee = Idee.new
  end

  def create
    @idee = Idee.new(idee_params)
    # we need `user_id` to associate idee with corresponding user
    @user = User.find(params[:user_id])
    @idee.user = @user
    @idee.save
    if @idee.save
      redirect_to   famille_user_path(@user.famille ,@user)
    else
      render 'users/show'
    end
  end

  private

  def idee_params
    params.require(:idee).permit(:content)
  end
end
