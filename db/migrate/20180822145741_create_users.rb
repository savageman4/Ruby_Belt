class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.string :alias
      t.text :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
