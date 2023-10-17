class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :comment
      t.float :price, default: 0.0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
