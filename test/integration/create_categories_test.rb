require 'test_helper'; 


class CreateCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        post login_path, params: { session: { email: user.email, password: password } }
    end

    test "get new category form and create category" do
    sign_in_as(@user,"password")
    get new_category_path             
    assert_template 'categories/new'    
        assert_difference 'Category.count', 1 do      
        post categories_path, params: { category: {name:"Book"} }
        
        end
        assert_template 'categories/index'        
        assert_match "sports", response.body
    end 

    test "invalid Category result in failure" do 
        sign_in_as(@user,"password")
        get new_category_path             
        assert_template 'categories/new'    
        assert_no_difference 'Category.count' do      
        post categories_path, params: { category:{name:" "} }
        end
        assert_template 'categories/new'        
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end 
end 