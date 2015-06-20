class AuthersController < ApplicationController
  def index
    @authers = Auther.all
  end

  def show
    @auther = Auther.find_by_id(params[:id])
    @auther_post = @auther.posts
  end

  def new
    @auther = Auther.new
  end

  def create
    @auther = Auther.new(auther_params)
    if @auther.save
      flash[:success] = "You have successfully created a new 
      auther!"
      redirect_to authers_path
    else 
      flash[:alert] = "Try again!"
      render :new
    end

  end

  def edit
    @auther = Auther.find_by_id(params[:id]) 
  end

  def update
    @auther = Auther.find_by_id(params[:id])
    if @auther.update_attributes(auther_params)
      flash[:success] = "You have successfully Edited an
      auther!"
      redirect_to authers_path
    else
      flash[:alert] = "Try again!"
      render :edit
    end

  end

  def destroy
    @auther = Auther.find_by_id(params[:id])
    @auther.destroy
  end

  def auther_params
    params.require(:auther).permit(:fname, :lname)
  end
end