class CreatePanier < ActiveRecord::Migration[6.0]
  def change
    
    create_table :paniers do |t|
      t.bigint :numUser
      t.boolean :valide ,default: false
    end

  end
end
