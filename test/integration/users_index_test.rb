require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
    
    def setup
    @admin     = users(:Julie)
    @non_admin = users(:archer)
    end

 

end
