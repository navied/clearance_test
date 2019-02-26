require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    user = User.find(1)
    get recipes_url(as: user)
    assert_response :success
    assert_match "Sign Out", response.body
  end

  test "should get new" do
    user = User.find(1)
    get new_recipe_url(as: user)
    assert_response :success
  end

  test "should create recipe" do
    user = User.find(1)
    assert_difference('Recipe.count') do
      post recipes_url(as: user, params: { recipe: {  } })
    end
    follow_redirect!
    assert_match "Sign Out", response.body  
  end
end
