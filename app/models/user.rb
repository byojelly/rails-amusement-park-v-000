class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password  #so that our user has methods such as #password, #confirmation, #authenticate

    def Mood
          if self.happiness && self.nausea
              mood = self.happiness - self.nausea
              mood > 0 ? "happy" : "sad"
          end
    end
    def num_of_rides
      self.attractions.count
    end
end
