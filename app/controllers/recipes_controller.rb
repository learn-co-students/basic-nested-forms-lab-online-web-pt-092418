class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'sugar', quantity: '1 cup')
    @recipe.ingredients.build(name: 'vanilla', quantity: '1 tablespoon')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    render :show
  end

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredients_attributes: [
      :name,
      :quantity,
      :recipe_id
    ]
  )
  end

end
