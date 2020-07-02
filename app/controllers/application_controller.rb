class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :profile])
  end
  def set_search
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) DESC').limit(3).pluck(:post_id))
    @search = Post.ransack(params[:q]) #ransackの検索メソッド
    @search_products = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(10) # productsの検索結果一覧 
     # 検索結果の一覧：  @search_products = @search.result.order(created_at: "DESC")
  end
end
