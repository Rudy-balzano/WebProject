class CreateAdmin < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nom
      t.string :prenom
      t.string :mail
      t.bigint :numUser
      t.string :mdp
    end

    #add a foreign key
    execute <<-SQL
      ALTER TABLE admins
        ADD CONSTRAINT admins_users_fk
        FOREIGN KEY (numUser)
        REFERENCES users(id)
    SQL
  end
end
