class CreatePanier < ActiveRecord::Migration[6.0]
  def change
    
    create_table :paniers do |t|
      t.bigint :numUser
    end

  end
end
