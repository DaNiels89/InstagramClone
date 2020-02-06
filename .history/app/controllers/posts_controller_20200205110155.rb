# frozen_string_literal: true

class PostsController < ApplicationController
  def index; end

  def new
    @post = Post.new
  end

  def create
    Post.create(params)
  end

  private

  def post_params
    params.require(:post).permit(:caption, :pic)
  end
end
