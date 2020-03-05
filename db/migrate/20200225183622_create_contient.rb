class CreateContient < ActiveRecord::Migration[6.0]
  def change
    create_table :contients do |t|
      t.bigint :numArticle
      t.bigint :numPanier
      t.integer :quantite
    end
  end
end
