require 'test_helper'; 

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    # def setup
    #     # @category = Category.create(name: "sports")    
    #     @user = User.create(username: "john", email:"john@example.com", password:"password", admin:"true")
    # end
    def sign_in_as(user, password)
        post login_path, params: { session: { email: user.email, password: password } }
    end 
    test "should get categories Index" do
        get categories_path
        assert_response :success
    end

    test "should get new" do 
        get new_category_path
        assert_response :success

    end

    test "should redirect creat when admin not logged in" do 
        assert_no_difference 'Category.count' do
        post categories_path, params:{category:{name:"sports"}}  
        end 
        assert_redirected_to categories_path
    end 

end 