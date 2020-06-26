class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :author, index: true
      t.string :title
      t.text :text

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :author_id
  end
end
