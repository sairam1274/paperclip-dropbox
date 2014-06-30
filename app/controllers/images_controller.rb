class ImagesController < ApplicationController
  before_filter :must_run
  def index
  end

  def create
    image = Image.new(params_list)
    image.save
    render :index
  end

  private

  def must_run
    @image = Image.new
    @images = Image.all
  end

  def params_list
    params.require(:image).permit!
  end
end


