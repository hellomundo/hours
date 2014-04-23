class PagesController < ApplicationController
  before_action :signed_in_user

  def home
    @effort = Effort.new
    @efforts = Effort.all
  end
end
