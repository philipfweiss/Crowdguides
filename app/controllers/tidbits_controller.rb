class TidbitsController < ApplicationController
  def new
    @guide_id = params[:guide_id]
    @advice_id = params[:advice_id]
    @tidbit_type = params[:tidbit_type]
    @tidbit = Tidbit.new
  end

  def create
  end

  private

  def tidbit_params
    ## Can we make sure this doesn't break when another user tries to submit as someone else?
    params.require(:tidbit).permit(:title, :contents, :issue_type, :user_id)
  end
end
