class Ride < ActiveRecord::Base
  # write associations here   rspec spec/models/ride_spec.rb
  belongs_to :user
  belongs_to :attraction

  def take_ride
        binding.pry
  end
end
