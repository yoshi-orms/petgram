class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
