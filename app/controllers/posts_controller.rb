class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(author_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render new_post_path @post
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
