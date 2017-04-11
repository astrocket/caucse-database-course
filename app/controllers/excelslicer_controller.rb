class ExcelslicerController < ApplicationController
  def index
  end

  def new
    @asset = Asset.all
  end

  def show
    chunk = params[:data]
    @data = excelslicer(chunk)
    render 'show'
  end
end
