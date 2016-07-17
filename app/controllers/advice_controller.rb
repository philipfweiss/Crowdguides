class AdviceController < ApplicationController
  def index
  end

  def show
    @guide = Guide.find(params[:guide_id])
    @id = params[:id]
    @advice = @guide.advices.find_by(inner_guide_id: params[:id])
    @blockers = @advice.tidbits.where(:issue_type => 'blocker').paginate(page: params[:page], :per_page => 10)
    @warnings = @advice.tidbits.where(:issue_type => 'warning').paginate(page: params[:page], :per_page => 10)
    @tips = @advice.tidbits.where(:issue_type => 'tip').paginate(page: params[:page], :per_page => 10)



    redirect_to @guide if @advice.nil?
  end


end
