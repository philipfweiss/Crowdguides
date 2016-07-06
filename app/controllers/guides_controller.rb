class GuidesController < ApplicationController
  def new
    if logged_in?
      @guide = current_user.guides.build
    else
      @guide = Guide.new
    end

      @user = current_user
  end

  def create
    if logged_in?
      @guide = current_user.guides.build(guides_params)
    else
      @guide = Guide.create(guides_params)
    end
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
