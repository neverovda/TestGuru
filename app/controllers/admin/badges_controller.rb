class Admin::BadgesController < Admin::BaseController

  before_action :find_badges, only: %i[index]
  before_action :find_badge, only: %i[show update destroy]

  def index

  end

  def show
    category = Category.find_by_id(@badge.category_id)
    if category
      @category_title = category.title
    else
      @category_title = ""
    end    
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = current_user.author_badges.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.success') 
    else
      render :new
    end
  end

  def update
   if @badge.update(badge_params)
      redirect_to [:admin, @badge] 
    else
      render :edit
    end
  end
  
  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :level,
                                  :category_id, :one_successful_attempt)
  end  

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
