class CreateClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :classifications do |t|
      t.references :category, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
    add_index :classifications, %i[category_id review_id], unique: true, name: :by_classification
  end
end
