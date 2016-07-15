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
      else
        flash[:success] = "Guide created!"
      end
      redirect_to @guide
    else
      render 'new'
      flash.now[:failure] = "Failed to create your guide"

    end
  end

  def index
    @guides = Guide.paginate(page: params[:page], :per_page => 5)
  end

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


  def destroy
  end

  private

    def guides_params
      params.require(:guide).permit(:title, :description, :content)
    end

end
