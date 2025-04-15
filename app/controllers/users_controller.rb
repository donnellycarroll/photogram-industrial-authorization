class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]

  def index
    @users = @q.result
  end

  def feed
    if current_user != @user
      redirect_back(fallback_location: "/", alert: "You're not authorized for that.")
      return
    end

  end

  def discover
    if current_user != @user
      redirect_back(fallback_location: "/", alert: "You're not authorized for that.")
      return
    end

  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
end
