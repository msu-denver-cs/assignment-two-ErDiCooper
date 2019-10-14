require 'test_helper'

class MakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Start make name tests.
  test "for < 4 character name" do
	s = Make.create({:name => "car", :country => "Japan"})
	refute s.valid?
	refute s.save
	assert_equal({:name=>["is too short (minimum is 4 characters)"]},
		s.error.messages)
	end
	
	test "for > 12 character name" do
	s = Make.create({:name => "large elephant", :country => "Japan"})
	refute s.valid?
	refute s.save
	assert_equal({:name=>["is too long (maximum is 12 characters)"]},
		s.error.messages)
	end
	
	test "for => 4 and =< 12 name" do
	s = Make.create({:name => "Honda", :country => "Japan"})
	assert s.valid?
	assert s.save
	assert_equal({}, s.error.messages)
	end
	# End make name tests.
	
	# Start make country tests.
	test "for < 2 character country" do
	s = Make.create({:name => "Honda", :country => "a"})
	refute s.valid?
	refute s.save
	assert_equal({:country=>["is too short (minimum is 2 characters)"]},
		s.error.messages)
	end
	
	test "for > 15 character country" do
	s = Make.create({:name => "Honda", :country => "Land of Large Elephants"})
	refute s.valid?
	refute s.save
	assert_equal({:country=>["is too long (maximum is 15 characters)"]},
		s.error.messages)
	end
	
	test "for => 2 and =< 15 character countries" do
	s = Make.create({:name => "Honda", :country => "Japan"})
	assert s.valid?
	assert s.save
	assert_equal({}, s.error.messages)
	end
	# End make country tests.
end
