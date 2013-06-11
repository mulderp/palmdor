class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.integer :movie_id
      t.integer :stars, :default => 0

      t.timestamps
    end
  end
end
