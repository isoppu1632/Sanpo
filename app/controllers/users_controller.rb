class UsersController < ApplicationController

  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @request = Request.new
    @users = current_user.matchers if user_signed_in?
    @pets = @user.pets

  end

  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name , :last_name, :email , :image, :appeal, :postcode, :prefecture_id , :city, :block, :building, :tel)
  end

end
