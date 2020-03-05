class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :mail
      t.string :password_digest
    end
  end
end
