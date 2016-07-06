class GuidesController < ApplicationController
  def new
    @guide = current_user.guides.build
    @user = current_user
  end

  def create
    @guide = current_user.guides.build(guides_params)
    if @guide.save
      flash[:success] = "Guide created!"
      redirect_to @user
    else
      flash[:failure] = "Failed to create your guide"
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def guides_params
      params.require(:guide).permit(:title, :description)
    end

end
