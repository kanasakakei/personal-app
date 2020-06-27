class UsersController < ApplicationController


def edit
end

def new
  @user = User.new
end

def create
  @user = User.find(params[:id])
  User.create(user_params)
  redirect_to user_path(@user)
end

def update
  if current_user.update(user_params)
    redirect_to root_path
  else
    render :edit
  end
end

def show
  @user = User.find(params[:id])
end

private

def user_params
  params.require(:user).permit(:name, :email, :image)
end

end
