require 'test_helper'

class EstudianteControllerTest < ActionDispatch::IntegrationTest
  test "should get alta" do
    get estudiante_alta_url
    assert_response :success
  end

end
