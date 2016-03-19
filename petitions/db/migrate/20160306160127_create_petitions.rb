class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :vote_id

      t.timestamps :date
    end
  end
end
