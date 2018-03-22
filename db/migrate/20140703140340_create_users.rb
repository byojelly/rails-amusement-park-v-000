class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
t.integer :nausea
t.integer :nausea_rating
t.integer :happiness
t.integer :happiness_rating
t.integer :tickets
t.integer :height
t.boolean :admin



      t.timestamps null: false
    end
  end
end
