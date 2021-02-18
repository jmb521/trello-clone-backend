class RegistrationsController < ApplicationController
  
  def create
    @user = User.new(
      email: params["user"]["email"], 
      password: params["user"]["password"], 
      password_confirmation: params["user"]["password_confirmation"],
      first_name: params["user"]["first_name"]
      last_name: params["user"]["last_name"]
    )

    if @user.save
      session[:user_id] = @user.id
      render json: {
        status :created,
        user: @user
      }
    else 
      render json: {
        status: 500, 
        errors: @user.errors
      }
    end
  end 
  
end 