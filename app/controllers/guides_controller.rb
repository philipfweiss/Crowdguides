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
      if @user
        flash[:success] = "Guide created!"
        redirect_to @user
      else
        flash[:success] = "Guide created!"
        redirect_to home_path
      end
    else
      flash.now[:failure] = "Failed to create your guide"

    end
  end

  def destroy
  end

  private

    def guides_params
      params.require(:guide).permit(:title, :description, :content)
    end

end
