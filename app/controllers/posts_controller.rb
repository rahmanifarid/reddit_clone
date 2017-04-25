class PostsController < ApplicationController
  before_action :require_logged_in, only: [:edit, :new, :create, :update, :destroy]

  def new
    @post = Post.new
    @sub = Sub.find(params[:sub_id])
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:sub_id])

    @post = @sub.posts.find(params[:id])

  end

  def create

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # debugger
    if @post.save
      redirect_to sub_post_url(id: @post.id)
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id, :sub_ids => [])
  end
end
