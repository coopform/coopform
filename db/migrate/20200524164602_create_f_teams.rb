class CreateFTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :f_teams do |t|
      t.bigint :user_id
      t.string :f_one, limit: 50
      t.string :f_two, limit: 50
      t.string :f_three, limit: 50
      t.string :f_four, limit: 50
      t.string :f_five, limit: 50
      t.string :f_six, limit: 50
      t.string :f_seven, limit: 50
      t.timestamps
    end
  end
end
