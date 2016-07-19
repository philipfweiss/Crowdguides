class TidbitsController < ApplicationController
  def new
    @tidbit_type = params[:tidbit_type]
    @guide = Guide.find(params[:guide_id])
    @advice = @guide.advices.find_by(inner_guide_id: params[:advice_id])
    session[:last_guide] = params[:guide_id]
    session[:last_advice] = params[:advice_id]

    unless @tidbit_type == 'tip' || @tidbit_type == 'issue' || @tidbit_type == 'question'
      redirect_to @guide
    end


    @tidbit = Tidbit.new
  end

  def create
    @tidbit = Tidbit.new(tidbit_params)
    if @tidbit.save
      flash[:success] = "You Successfully Submitted Your Question"
    end

    redirect_to "/guides/#{session[:last_guide]}/advice/#{session[:last_advice]}"
  end

  def show
    @tidbit = Tidbit.find(params[:id])
    @advice = Advice.find(@tidbit.advice_id)
    @guide = Guide.find(@advice.guide_id)


    if @tidbit.user_id != nil
      @author = User.find(@tidbit.user_id)
    else
      @author = "(Anon) " + Faker::Color.color_name.capitalize + " " + Faker::Hipster.words[0].capitalize
    end
  end

  private

  def tidbit_params
    ## Can we make sure this doesn't break when another user tries to submit as someone else?
    params.require(:tidbit).permit(:title, :contents, :issue_type, :advice_id, :user_id, :bootsy_image_gallery_id)
  end
end
:bootsy_image_gallery_id