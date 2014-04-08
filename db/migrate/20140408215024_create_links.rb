class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :link_url
      t.text :img_url
      t.references :user
      t.references :ranking
    end
  end
end
