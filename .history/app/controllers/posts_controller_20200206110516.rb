# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
      flash[:notice] = 'Post created!'
    else
      redirect_back(failback_location: root_path)
      flash[:alert] = 'Post creation failed'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id]).destroy
    if current_user == post.user
      post.destroy
      redirect_to '/posts'
      flash[:notice] = 'Post destroyed'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to delete the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :pic)
  end
end
