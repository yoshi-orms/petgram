class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
