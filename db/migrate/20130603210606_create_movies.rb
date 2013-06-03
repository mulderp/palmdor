class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :original_title
      t.string :director

      t.timestamps
    end
  end
end
