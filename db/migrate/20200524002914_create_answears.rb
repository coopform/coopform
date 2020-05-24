class CreateAnswears < ActiveRecord::Migration[5.1]
  def change
    create_table :answears do |t|
      t.bigint :user_id
      t.bigint :number
      t.string :value, limit: 1000
      t.timestamps
    end
  end
end
