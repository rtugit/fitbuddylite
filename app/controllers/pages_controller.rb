class PagesController < ApplicationController
  def home
    redirect_to workout_plans_path if user_signed_in?
  end
end
