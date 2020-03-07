class Client < ApplicationRecord

    has_secure_password

    validates :mail, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: " : Invalid email"}, uniqueness: {case_sensitive: false, message: "Email has already been used"}

    validates :prenom, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid first name"}

    validates :nom, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid last name"}

    validates :rue, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid street name"}

    validates :ville, format: {with: /\A[a-zA-Z]+$\z/, message: " : Invalid city name"}

    validates :numero, presence: true

    validates :codePostal, presence: true



end