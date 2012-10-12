class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.references :author
      t.text :abstract
      t.text :content

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
