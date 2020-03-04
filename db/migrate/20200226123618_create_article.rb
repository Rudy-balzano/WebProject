class CreateArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :libelle
      t.float :prix
      t.integer :stock
      t.bigint :categorie
      t.string :type
    end

    #add a foreign key
    execute <<-SQL
      ALTER TABLE articles
        ADD CONSTRAINT aricles_categories_fk
        FOREIGN KEY (categorie)
        REFERENCES categories(id)
    SQL
  end
end
