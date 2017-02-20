class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.string :email
      t.string :email_for_index, index: true, unique: true
      t.string :hashed_password
      t.boolean :suspended

      t.timestamps
    end
  end
end
