class Admin < ApplicationRecord

    has_secure_password

    validates :mail, format: {with: /\A[a-zA-Z]+$\z/}, uniqueness: {case_sensitive: false}

    validates :prenom, format: {with: /\A[a-zA-Z]+$\z/}

    validates :nom, format: {with: /\A[a-zA-Z]+$\z/}

    
end