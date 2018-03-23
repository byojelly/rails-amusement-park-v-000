class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password  #so that our user has methods such as #password, #confirmation, #authenticate

  
end
