class UsersController < ApplicationController
  def index
  end

  def create
    User.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      area_code: params[:area_code]
    )
  end

  def login

  end
end
