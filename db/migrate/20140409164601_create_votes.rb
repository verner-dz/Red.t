class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :upvote
      t.boolean :downvote
      t.references :user
      t.references :ranking
    end
  end
end
