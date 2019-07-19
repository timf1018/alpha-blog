require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

test "get new category form and create category" do
  get new_category_path #go to new category path
  assert_template 'categories/new' # get the new form
  assert_difference 'Category.count', 1 do
    post categories_path, params:{category:{name:'sports'}} #posting sports to form
  end
  follow_redirect!
  assert_template "categories/index"
  assert_match 'sports', response.body #index page should have sports
end

test "invalid category submission results in failure" do
    get new_category_path  #go to new category path
    assert_template 'categories/new'  # get the new form
    assert_no_difference 'Category.count' do
      post categories_path, params:{category:{name:" "}} #posting sports to form
    end
    assert_template "categories/new"
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
