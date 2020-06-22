class CommentsController < ApplicationController

def index
end

def create
  @post = Post.find(params[:post_id])
  @comment = @past.comments.create(comment_params)
  
end

def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end


private

def comment_params
  params.require(:comment).permit(:content)
  
end


end
