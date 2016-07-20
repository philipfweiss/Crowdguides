class GuidesController < ApplicationController
  def show
    @guide = Guide.find(params[:id])
    if !@guide.user_id.nil?
      @owner = User.find(@guide.user_id)
    else
      @owner = nil
    end

    gon.push({
                 :title => @guide.title,
                 :description => @guide.description,
                 :content => @guide.content,
                 :current_guide => params[:id]
             })
  end
end