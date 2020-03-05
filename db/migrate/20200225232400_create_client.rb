class CreateClient < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
        t.string :nom
        t.string :prenom
        t.string :mail
        t.integer :numero
        t.string :rue
        t.integer :codePostal
        t.string :ville
        t.bigint :numUser
        t.string :password_digest
    end

  end
end


