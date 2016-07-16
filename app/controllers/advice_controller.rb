class AdviceController < ApplicationController
  def index
  end

  def show
    @guide = Guide.find(params[:guide_id])
    @id = params[:id]
    @advice = @guide.advices.find_by(inner_guide_id: params[:id])
    redirect_to @guide if @advice.nil?
  end


end
