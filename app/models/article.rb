class Article < ApplicationRecord

    has_one_attached :avatar

    accepts_nested_attributes_for :avatar_attachment, allow_destroy: true

    validates :libelle, presence: true

    validates :prix, presence: true

    validates :categorie, presence: true

    
end