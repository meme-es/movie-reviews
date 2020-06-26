class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
    add_index :votes, %i[user_id review_id], unique: true, name: :by_vote
  end
end
