class PagesController < ApplicationController
  before_action :signed_in_user

  def home
    @effort = Effort.new
    @efforts = Effort.all
    
    @date_options = [
      ['today', Date.today.strftime('%F')],
      ['yesterday', Date.today.advance(:days => -1).strftime('%F')],
      [2.days.ago.strftime('%A'), Date.today.advance(:days => -2).strftime('%F')],
      [3.days.ago.strftime('%A'), Date.today.advance(:days => -3).strftime('%F')] ]
  end
end
