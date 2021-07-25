# frozen_string_literal: true

# Controllers for the User model
class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
