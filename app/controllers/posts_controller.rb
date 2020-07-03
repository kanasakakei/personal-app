class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: 'DESC').page(params[:page]).per(10)
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) DESC').limit(5).pluck(:post_id))
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = '【エラー】投稿できませんでした。'
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
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
