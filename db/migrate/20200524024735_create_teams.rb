class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.bigint :user_id
      t.string :person, limit: 100
      t.timestamps
    end
  end
end
