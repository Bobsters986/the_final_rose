class BachelorettesController < ApplicationController
  def index
    @bachelorettes = Bachelorette.all
  end

  def show
    @bachelorette = Bachelorette.find(params[:id])
  end
end