require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Start car VIN tests.
  test "for < 17 character VIN" do
	s = Car.create({:vin => "123456789012345", :model => "Mustang"})
	refute s.valid?
	refute s.save
	assert_equal({:country=>["is too short (must be 17 characters)"]},
		s.error.messages)
	end
	
  test "for > 17 character VIN" do
	s = Car.create({:vin => "12345678901234567890", :model => "Mustang"}, {})
	refute s.valid?
	refute s.save
	assert_equal({:vin=>["is too long (must be 17 characters)"]},
		s.error.messages)
	end
	
  test "for 17 character VIN" do
	s = Car.create({:vin => "12345678901234567", :model => "Mustang"})
	assert s.valid?
	assert s.save
	assert_equal({},
		s.error.messages)
	end
  # End car VIN tests.
  
  # Start car model tests.
  test "for < 3 character model" do
	s = Car.create({:vin => "12345678901234567", :model => "ab"})
	refute s.valid?
	refute s.save
	assert_equal({:model=>["is too short (minimum is 3 characters)"]},
		s.error.messages)
	end

  test "for > 40 character model" do
	s = Car.create({:vin => "12345678901234567", :model => "I will just write an entire sentence here."})
	refute s.valid?
	refute s.save
	assert_equal({:model=>["is too long (maximum is 40 characters)"]},
		s.error.messages)
	end

  test "for => 3 and 4< 40 character model" do
	s = Car.create({:vin => "12345678901234567", :model => "Mustang"})
	assert s.valid?
	assert s.save
	assert_equal({}, s.error.messages)
	end
  # End car model tests.
end
