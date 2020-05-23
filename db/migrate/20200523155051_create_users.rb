class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, limit: 30
      t.string :surname, limit: 30
      t.boolean :email_confirmed, default: false
      t.string :confirm_token
      t.boolean :admin, default: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
