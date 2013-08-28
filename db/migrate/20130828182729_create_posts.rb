class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :subject 
      t.text :content
      t.timestamps
    end
  end
end
