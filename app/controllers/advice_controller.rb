class AdviceController < ApplicationController
  def index
  end

  def show
    @guide = Guide.find(params[:guide_id])
    @id = params[:id]
  end


end
