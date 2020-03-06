class CreateArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :libelle
      t.float :prix
      t.string :categorie
      
    end

  end
end
