class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :pic_url
      t.references :user, foreign_key: true
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
