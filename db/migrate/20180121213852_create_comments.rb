class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.integer :rating
      t.boolean :active, default: false
      t.integer :author_id
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
