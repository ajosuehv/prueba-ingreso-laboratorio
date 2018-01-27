require 'test_helper'

class EstudiantesControllerTest < ActionDispatch::IntegrationTest
  test "should get nuevo" do
    get estudiantes_nuevo_url
    assert_response :success
  end

end
