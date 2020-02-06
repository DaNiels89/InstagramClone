# frozen_string_literal: true

class PostsController < ApplicationController
  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:caption, :pic)
  end
end
