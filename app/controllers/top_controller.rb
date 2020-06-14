class TopController < ApplicationController
  # before_action :, {only: [:top]}

  def index
    render layout: "top_page"
  end

end
