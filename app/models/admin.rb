class Admin < ApplicationRecord

    has_secure_password

    validates :mail, format: {with: /\A[a-zA-Z0-9]+$\z/, message: " : Invalid username"}, uniqueness: {case_sensitive: false, message: "Username has already been used"}

    validates :prenom, presence: true

    validates :nom, presence: true

    
end