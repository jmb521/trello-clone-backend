class StaticController < ApplicationController
  def home 
    render json: { status: "placeholder"}
  end
end 