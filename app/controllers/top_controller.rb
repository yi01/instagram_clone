class TopController < ApplicationController
  def index
    @picture = Picture.new
    @pictures = Picture.all
  end
end
