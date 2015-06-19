class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "You have successfully created a new Post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Enable to create Post please try again!"
      render :new
    end
  end


  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.destroy
      flash[:success] = "You have successfully deleted Post!"
      redirect_to posts_path
    else
      flash[:alert] = "Enable to delete Post please try again!"
      render posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :post)
  end

end