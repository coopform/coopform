class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 50
      t.string :description, limit: 400
      t.timestamps
    end
  end
end
