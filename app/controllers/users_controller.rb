class UsersController < ApplicationController
def new
@user  = User.new
end
def create
 @user = User.new(:email => params[:email], :password =>params[:password], :password_confirmation => params[:password_confirmation])
if @user.save
session[:user_id] = @user.id
redirect_to root_url, notice: "you successfuly sigined up "
else
render 'new'
end 
end
end
