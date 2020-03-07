class Admin < ApplicationRecord

    has_secure_password

    validates :mail, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid username"}, uniqueness: {case_sensitive: false, message: "Email has already been used"}

    validates :prenom, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid first name"}

    validates :nom, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid last name"}

    
end