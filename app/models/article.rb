class Article < ApplicationRecord
    validates :libelle, presence :true
end