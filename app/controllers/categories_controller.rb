class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5) #gives us the @categories
  end

  def new
    @category = Category.new #gives us our instance variable for the form
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show

  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
