class PostsController < ApplicationController

def index
  @posts = Post.all.order(created_at: 'DESC').page(params[:page]).per(10)

end

def new
  @post = Post.new
end

def create
  Post.create(post_params)
  redirect_to "/posts"
end

def show
  @post = Post.find(params[:id])
  @comment = Comment.new
end

def edit
  @post = Post.find(params[:id])
end

def update
  post = Post.find(params[:id])
  post.update(post_params)
end

def destroy
  post = Post.find(params[:id])
  post.destroy
  redirect_to "/posts"
end

private
def post_params
  params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
end

end
