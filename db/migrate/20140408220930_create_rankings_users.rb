class CreateRankingsUsers < ActiveRecord::Migration
  def change
    create_table :rankings_users, id: false do |t|
      t.references :user
      t.references :ranking
    end
  end
end
