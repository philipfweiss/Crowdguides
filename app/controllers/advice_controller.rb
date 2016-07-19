class AdviceController < ApplicationController
  def index
  end

  def show
    @guide = Guide.find(params[:guide_id])
    @id = params[:id]
    @advice = @guide.advices.find_by(inner_guide_id: params[:id])

    if @advice.nil?
      redirect_to @guide
    else
      @issues = @advice.tidbits.where(:issue_type => 'issue').paginate(page: params[:page], :per_page => 8)
      @questions = @advice.tidbits.where(:issue_type => 'question').paginate(page: params[:page], :per_page => 8)
      @tips = @advice.tidbits.where(:issue_type => 'tip').paginate(page: params[:page], :per_page => 8)
    end
  end


end
