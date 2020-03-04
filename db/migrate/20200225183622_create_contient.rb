class CreateContient < ActiveRecord::Migration[6.0]
  def change
    create_table :contients do |t|
      t.bigint :numArticle
      t.bigint :numPanier
      t.integer :quantite
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE contients
        ADD CONSTRAINT contients_paniers_fk
        FOREIGN KEY (numPanier)
        REFERENCES paniers(id)
    SQL
    execute <<-SQL

      ALTER TABLE contients
        ADD CONSTRAINT contients_articles_fk
        FOREIGN KEY (numArticle)
        REFERENCES articles(id)
    SQL
  end
end
