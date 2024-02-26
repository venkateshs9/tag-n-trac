class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:launch]

  def launch; end
end
