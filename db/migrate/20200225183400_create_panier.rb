class CreatePanier < ActiveRecord::Migration[6.0]
  def change
    create_table :paniers do |t|
      t.bigint :numUser
    end

    #add a foreign key
    execute <<-SQL
      ALTER TABLE paniers
        ADD CONSTRAINT paniers_users_fk
        FOREIGN KEY (numUser)
        REFERENCES users(id)
    SQL


  end
end
