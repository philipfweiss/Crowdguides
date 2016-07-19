class TidbitsController < ApplicationController
  def new
    @tidbit_type = params[:tidbit_type]
    @guide = Guide.find(params[:guide_id])
    @advice = @guide.advices.find_by(inner_guide_id: params[:advice_id])

    unless @tidbit_type == 'tip' || @tidbit_type == 'issue' || @tidbit_type == 'question'
      redirect_to guide
    end

    unless logged_in?
      redirect_to @guide
    end


    @tidbit = Tidbit.new
  end

  def create
    unless logged_in?
      redirect_to @guide
    end

    @tidbit = Tidbit.new(tidbit_params)
    if @tidbit.save
      flash[:success] = "You Successfully Submitted Your Question"
    end

    if logged_in?
      redirect_to current_user
    else
      render 'new'
    end

  end

  private

  def tidbit_params
    ## Can we make sure this doesn't break when another user tries to submit as someone else?
    params.require(:tidbit).permit(:title, :contents, :issue_type, :advice_id, :user_id)
  end
end
