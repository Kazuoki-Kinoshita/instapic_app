class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :user_name
      t.text :image
      t.string :password_digest

      t.timestamps
    end
  end
end
