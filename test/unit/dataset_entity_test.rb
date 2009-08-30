require 'test_helper'

class DatasetEntityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "restaurant entity is sane" do
    restaurant = dataset_entities(:some_restaurant)
    dataset = datasets(:auckland)
    assert_equal dataset, restaurant.dataset
  end
end

