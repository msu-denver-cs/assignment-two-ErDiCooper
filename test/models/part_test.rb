require 'test_helper'

class PartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Start part name tests.
  test "for < 2 character name" do
	s = Part.create({:name => "a"})
	refute s.valid?
	refute s.save
	assert_equal({:name=>["is too short (minimum is 2 characters)"]},
		s.error.messages)
	end
	
  test "for > 20 character name" do
	s = Part.create({:name => "This is a very long string"})
	refute s.valid?
	refute s.save
	assert_equal({:name=>["is too long (maximum is twenty characters)"]},
		s.error.messages)
	end
		
  test "for => 2 and =< 20 name" do
	s = Part.create({:name => "Engine"})
	assert s.valid?
	assert s.save
	assert_equal({}, s.error.messages)
	end
	# End part name tests.
end
