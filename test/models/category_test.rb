require_relative '../test_helper'

class CategoryTest < Minitest::Test
  def test_category_attributes_assigned_correctly
    data = { name: "Sphero", description: "Robotic Ball" }
    sphero = Category.new(data)

    assert_equal "Sphero", sphero.name
    assert_equal "Robotic Ball", sphero.description
  end
end
