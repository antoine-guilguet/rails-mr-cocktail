class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    raise 'good'
    @dose = Dose.find(params[:id])
  end
end
