class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :score
      t.references :link
    end
  end
end
