class CreateAdmin < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nom
      t.string :prenom
      t.string :mail
      t.bigint :numUser
      t.string :password_digest
    end

  end
end
