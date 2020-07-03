class UsersController < ApplicationController


def edit
  @user = User.find(params[:id])
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
  @user = User.find(params[:id])
  if current_user.update(user_params)
    redirect_to user_path(@user)
  else
    render :edit
  end
end

def show
  @user = User.find(params[:id])
  @posts = current_user.posts.order(created_at: 'DESC').page(params[:page]).per(5)
end

private

def user_params
  params.require(:user).permit(:name, :email, :image, :profile)
end

end
