class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    Post.create(nickname: params[:nickname])
    Post.create(email: params[:email])
    Post.create(password: params[:password])
    Post.create(first_name: params[:first_name])
    Post.create(family_name: params[:family_name])
    Post.create(first_name_kana: params[:first_name_kana])
    Post.create(family_name_kana: params[:family_name_kana])
    Post.create(birth_date: params[:birth_date])
  end
end
