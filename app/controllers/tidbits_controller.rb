class TidbitsController < ApplicationController
  def new
    @guide_id = params[:guide_id]
    @advice_id = params[:advice_id]
  end
end
