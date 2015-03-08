class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :copy
      t.integer :price

      t.timestamps null: false
    end
    add_primary_key :id
  end
end
