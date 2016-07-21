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
      if @user1
        flash[:success] = "Guide created!"
      else
        flash[:success] = "Guide created!"
      end

      advices = @guide.content.scan(/\[\s?(\d{1,10})\s?\]/)
      seen = Hash.new(0)
      advices.each do |x|
        if seen[x[0]] == 0
          Advice.create({guide_id: @guide.id, inner_guide_id: x[0], description: ""})
          seen[x[0]]+=1
        end
      end

      redirect_to @guide

    else
      render 'new'
      flash.now[:failure] = "Failed to create your guide"

    end
  end

  def index

    @guides = Guide.paginate(page: params[:page], :per_page => 5)
    if params[:search]
      guides = Guide.search ThinkingSphinx::Query.escape(params[:search])
      @guides = Guide.where(:id => guides).paginate(page: params[:page], :per_page => 5)
    else
      @guides = Guide.all.order('created_at DESC').paginate(page: params[:page], :per_page => 5)

    end
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
