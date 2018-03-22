class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  # this is a joins table so you can have many through many
  def change
    create_table :rides do |t|
        t.integer :user_id
        t.integer :attraction_id
    end
  end
end
